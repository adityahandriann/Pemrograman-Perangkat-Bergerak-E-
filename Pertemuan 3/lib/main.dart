import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          "My First App",
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
              color: Colors.pink[200],
              child: const Text(
                'What image is that',
                style: TextStyle(fontSize: 16.0),
              ),
            ), // Container
            Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.only(bottom: 20.0),
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
                      Icon(Icons.landscape, size: 30.0),
                      SizedBox(height: 8.0),
                      Text('Scenery'),
                    ],
                  ), // Column
                  Column(
                    children: const [
                      Icon(Icons.people, size: 30.0),
                      SizedBox(height: 8.0),
                      Text('People'),
                    ],
                  ), // Column
                ],
              ), // Row
            ), // Container
            Container(
              padding: const EdgeInsets.all(20.0),
              color: Colors.cyan[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   const Text(
                    'Counter here: 4',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.cyan[200],
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.all(16.0),
                      minimumSize: const Size(50, 50),
                    ),
                    child: const Text('+', style: TextStyle(color: Colors.black, fontSize: 16.0)),
                  ),
                ],
              ),
            ),
          ],
        ), // Column
      ), // Padding
    ), // Scaffold
  )); // MaterialAp
}
