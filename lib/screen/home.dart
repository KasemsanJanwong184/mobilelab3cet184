// lib/screen/home.dart
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            onPressed: () {},
            child: const Text(
              "Click",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),

          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {},
            child: const Text(
              "Click",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),

          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blueGrey, width: 3),
              backgroundColor: Colors.yellowAccent,
              foregroundColor: Colors.blueGrey,
            ),
            onPressed: () {},
            child: const Text(
              "Click",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            onPressed: () {},
            child: const Text(
              "Click",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}