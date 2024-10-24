import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:renkahenk/test.dart';
import 'package:renkahenk/tutorial.dart';
import 'color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Renk Tespit Uygulaması',
      debugShowCheckedModeBanner: false,  // Debug yazısını kaldırmak için ekledik
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/test': (context) => const Test(),
        '/tutorial': (context) => const Tutorial(),
        '/camera': (context) => const CameraScreenWrapper(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ana Ekran'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/camera');
              },
              child: const Text('Kamerayı Aç'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/test');
              },
              child: const Text('Test'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tutorial');
              },
              child: const Text('Nasıl Kullanılır'),
            ),
          ],
        ),
      ),
    );
  }
}

class CameraScreenWrapper extends StatelessWidget {
  const CameraScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CameraDescription>>(
      future: availableCameras(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return ColorApp(cameras: snapshot.data!);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
