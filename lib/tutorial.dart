import 'package:flutter/material.dart';

class Tutorial extends StatelessWidget {
  const Tutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: const TutorialPageView(),
    );
  }
}

class TutorialPageView extends StatelessWidget {
  const TutorialPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/kirmizi.jpg',
      'assets/mavi.jpg',
      'assets/yesil.jpg',
      'assets/sari.jpg',
    ];

    return Container(
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        imagePaths[index],
                        fit: BoxFit.cover,
                      ),
                    ),

                    if (index == 0)
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 48,
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ana Menüye Dön'),
          ),
        ],
      ),
    );
  }
}
