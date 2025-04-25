# Cat Facts App

## Description

Cat Facts App is a Flutter application that allows users to retrieve random cat facts in various languages, save their favorite facts to a list, and view the saved facts.

## Features

- Retrieve random cat facts from an external API.
- Save favorite facts to a list.
- View saved facts.
- Clear the list of favorite facts.

## Technologies Used

- **Flutter** — A framework for building cross-platform mobile and web applications.
- **Dart** — The programming language used for Flutter development.
- **HTTP** — A library for sending requests and retrieving data from external APIs.

## How It Works

- The app sends a GET request to the API: `https://catfact.ninja/fact` to retrieve a random cat fact.
- The API responds with a fact in JSON format.
- The fact is displayed on the screen, and the user has the option to add it to a favorites list or view the saved facts.
- The app uses the `http` package to interact with the API.

