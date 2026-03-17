import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "My first app",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber[200],
      ), // AppBar
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(bottom: 20.0),
              color: Colors.cyan[100],
              child: Image.network(
                'https://picsum.photos/400/200',
                fit: BoxFit.cover,
                height: 250.0,
              ),
            ), // Container
            Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(bottom: 20.0),
              color: Colors.pink[100],
              child: const Text(
                'What image is that?',
                style: TextStyle(fontSize: 16.0),
              ),
            ), // Container
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.amber[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Icon(Icons.restaurant, size: 30.0),
                      SizedBox(height: 8.0),
                      Text('Food'),
                    ],
                  ), // Column
                  Column(
                    children: const [
                      Icon(Icons.umbrella, size: 30.0),
                      SizedBox(height: 8.0),
                      Text('Scenery'),
                    ],
                  ), // Column
                  Column(
                    children: const [
                      Icon(Icons.person, size: 30.0),
                      SizedBox(height: 8.0),
                      Text('People'),
                    ],
                  ), // Column
                ],
              ), // Row
            ) // Container
          ],
        ), // Column
      ), // Padding
    ), // Scaffold
  )); // MaterialApp
}
