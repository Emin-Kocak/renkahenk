import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Renk Körlüğü Testi'),
      ),
      body: TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<String> imagePaths = [
    'assets/ishihara_01.jpg',
    'assets/ishihara_02.jpg',
    'assets/ishihara_03.jpg',
    'assets/ishihara_04.jpg',
    'assets/ishihara_05.jpg',
    'assets/ishihara_06.jpg',
    'assets/ishihara_07.jpg',
    'assets/ishihara_08.jpg',
    'assets/ishihara_09.jpg',
    'assets/ishihara_10.jpg',
    'assets/ishihara_11.jpg',
    'assets/ishihara_12.jpg',
    'assets/ishihara_13.jpg',
    'assets/ishihara_14.jpg',
    'assets/ishihara_15.jpg',
  ];

  final List<int> correctAnswers = [
    12, 5, 7, 16, 73, 26, 42, 8, 29, 5, 3, 15, 74, 6, 45,
  ];

  final List<String> feedbackMessages = [
    'Renk körü olanlar ve normal görenler 12 görürler.',
    'Normal görenler 5 olarak görür. Tüm renklere karşı renk körü olanlar hiçbir şey göremez',
    'Normal görenler 7 olarak görür. Tüm renklere karşı renk körü olanlar hiçbir şey göremez.',
    'Normal görenler 16 olarak görür. Tüm renklere karşı renk körü olanlar hiçbir şey göremez.',
    'Normal görenler 73 olarak görür. Tüm renklere karşı renk körü olanlar hiçbir şey göremez.',
    'Renk körü olanlar 2 veya 6 olarak görürler. Normal görenler 26 olarak okurlar.',
    'Renk körü olanlar 2 veya 4 olarak görürler. Normal görenler 42 olarak okurlar.',
    'Kırmızı - Yeşil renk körü olanlar 3 olarak okur. Normal görenler 8 olarak görür.',
    'Kırmızı - Yeşil renk körü olanlar 79 olarak okur. Normal görenler 29 olarak görür.',
    'Kırmızı - Yeşil renk körü olanlar 2 olarak okur.Normal görenler 5 olarak görür.',
    'Kırmızı - Yeşil renk körü olanlar 5 olarak okur.Normal görenler 3 olarak görür.',
    'Kırmızı - Yeşil renk körü olanlar 17 olarak okur.Normal görenler 15 olarak görür.',
    'Kırmızı - Yeşil renk körü olanlar 21 olarak okur.Normal görenler 74 olarak görür.',
    'Normal görenler 6 olarak görür.Tüm renklere karşı renk körü olanlar hiç bir şey göremez.',
    'Normal görenler 45 olarak görür.Tüm renklere karşı renk körü olanlar hiç bir şey göremez.',
  ];

  final List<List<int>> options = [
    [12, 14, 9],
    [5, 3, 6],
    [7, 1, 4],
    [16, 18, 12],
    [7, 8, 73],
    [26, 6, 16],
    [42, 24, 18],
    [8, 3, 9],
    [29, 79, 12],
    [5, 8, 2],
    [3, 7, 5],
    [15, 17, 13],
    [74, 21, 14],
    [6, 8, 3],
    [45, 54, 32],
  ];

  int currentIndex = 0;
  int? selectedAnswer;
  String feedbackMessage = '';

  void nextQuestion() {
    if (currentIndex < imagePaths.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswer = null;
        feedbackMessage = '';
      });
    }
  }

  void goToHome() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePaths[currentIndex],
            alignment: Alignment.center,
          ),
          const SizedBox(height: 20),
          ...options[currentIndex].map((option) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswer == option
                        ? (option == correctAnswers[currentIndex]
                        ? Colors.green
                        : Colors.red)
                        : null,
                  ),
                  onPressed: () {
                    setState(() {
                      selectedAnswer = option;
                      feedbackMessage = feedbackMessages[currentIndex];
                    });
                  },
                  child: Text(option.toString()),
                ),
              ),
            );
          }).toList(),
          const SizedBox(height: 20),
          Text(
            feedbackMessage,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 20),
          if (currentIndex < imagePaths.length - 1)
            ElevatedButton(
              onPressed: selectedAnswer != null ? nextQuestion : null,
              child: const Text('Sonraki Soru'),
            )
          else
            ElevatedButton(
              onPressed: goToHome,
              child: const Text('Ana Menüye Dön'),
            ),
        ],
      ),
    );
  }
}
