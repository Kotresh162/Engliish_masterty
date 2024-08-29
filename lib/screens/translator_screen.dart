import 'package:flutter/material.dart';

class TranslationScreen extends StatefulWidget {
  const TranslationScreen({super.key});

  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  String? inputLanguage = 'French';
  String? outputLanguage = 'English';
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();

  void translateText() {
    // Add your translation logic here using the translator package
    setState(() {
      outputController.text = "brother"; // Placeholder result
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'LinguaShift',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Expand Your Reach, Translate with Ease.',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  LanguageInputField(
                    flagImage: 'assets/images/french_flag.png',
                    language: inputLanguage!,
                    controller: inputController,
                  ),
                  const SizedBox(height: 20),
                  const Icon(Icons.swap_vert, color: Colors.white),
                  const SizedBox(height: 20),
                  LanguageInputField(
                    flagImage: 'assets/images/english_flag.png',
                    language: outputLanguage!,
                    controller: outputController,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: translateText,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'CONVERT',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LanguageInputField extends StatelessWidget {
  final String flagImage;
  final String language;
  final TextEditingController controller;

  const LanguageInputField({
    super.key,
    required this.flagImage,
    required this.language,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(flagImage, height: 30, width: 30),
        const SizedBox(width: 10),
        Text(
          language,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: language == 'French' ? 'Enter text...' : '',
            ),
          ),
        ),
      ],
    );
  }
}
