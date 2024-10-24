import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  const Camera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kamera Açılacak'),
      ),
      body: const Center(
        child: Text(
          'Kamera Açılacak',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
