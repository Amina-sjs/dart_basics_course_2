import 'package:flutter/material.dart';
import '../services/cat_fact_service.dart';
import '../storage/liked_fact_storage.dart';
import 'liked_facts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentFact = 'Press "Get Fact" to start!';
  String _selectedLang = 'en';
  final List<String> _languages = ['en', 'es', 'fr'];

  @override
  void initState() {
    super.initState();
    LikedFactStorage.init();
  }

  Future<void> _getNewFact() async {
    final fact = await CatFactService.getCatFact(_selectedLang);
    setState(() {
      _currentFact = fact;
    });
  }

  void _likeCurrentFact() {
    LikedFactStorage.addFact(_currentFact);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Fact added to favorites')),
    );
    _getNewFact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Facts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LikedFactsScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedLang,
              items: _languages
                  .map((lang) => DropdownMenuItem(
                        value: lang,
                        child: Text(lang.toUpperCase()),
                      ))
                  .toList(),
              onChanged: (lang) {
                if (lang != null) {
                  setState(() => _selectedLang = lang);
                  _getNewFact();
                }
              },
              decoration: const InputDecoration(
                labelText: 'Language',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Center(
                child: Text(
                  _currentFact,
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: _likeCurrentFact,
                  icon: const Icon(Icons.thumb_up),
                  label: const Text('Like & Next'),
                ),
                ElevatedButton.icon(
                  onPressed: _getNewFact,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
