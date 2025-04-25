import 'package:flutter/material.dart';
import '../storage/liked_fact_storage.dart';

class LikedFactsScreen extends StatefulWidget {
  const LikedFactsScreen({super.key});

  @override
  State<LikedFactsScreen> createState() => _LikedFactsScreenState();
}

class _LikedFactsScreenState extends State<LikedFactsScreen> {
  List<String> _facts = [];

  @override
  void initState() {
    super.initState();
    _facts = LikedFactStorage.getFacts();
  }

  void _clearFacts() {
    LikedFactStorage.clear();
    setState(() {
      _facts = [];
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('All liked facts cleared')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liked Facts'),
        actions: [
          IconButton(
            onPressed: _clearFacts,
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: _facts.isEmpty
          ? const Center(child: Text('No liked facts yet.'))
          : ListView.builder(
              itemCount: _facts.length,
              itemBuilder: (_, index) => ListTile(
                leading: const Icon(Icons.pets),
                title: Text(_facts[index]),
              ),
            ),
    );
  }
}
