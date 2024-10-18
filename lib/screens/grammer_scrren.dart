import 'package:flutter/material.dart';
import 'test_page.dart'; // Import the Test Page

void main() {
  runApp(EnglishGrammarApp());
}

class EnglishGrammarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark, // Dark theme
        primaryColor: Colors.blue, // Primary color for buttons, etc.
        scaffoldBackgroundColor: Color(0xFF0D1B2A), // Dark blue background
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white), // White text
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFF1B263B), // Slightly lighter blue for input fields
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: TextStyle(color: Colors.white70), // Placeholder text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Color(0xFF007BFF), // Button text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
      home: GrammarHomePage(),
    );
  }
}

class GrammarHomePage extends StatefulWidget {
  @override
  _GrammarHomePageState createState() => _GrammarHomePageState();
}

class _GrammarHomePageState extends State<GrammarHomePage> {
  bool showMixedTopicsTest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('English Grammar', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0D1B2A),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Tab Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton('TOPIC', !showMixedTopicsTest, () {
                  setState(() {
                    showMixedTopicsTest = false;
                  });
                }),
                _buildTabButton('MIXED TOPICS TEST', showMixedTopicsTest, () {
                  setState(() {
                    showMixedTopicsTest = true;
                  });
                }),
              ],
            ),
            SizedBox(height: 20),
            // Conditional content based on the selected tab
            showMixedTopicsTest ? _buildMixedTopicsTestContent() : _buildTopicContent(),
          ],
        ),
      ),
    );
  }

  // Function to build the tabs
  Widget _buildTabButton(String title, bool isSelected, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF007BFF) : Color(0xFF1B263B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xFF007BFF),
            width: 2,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Color(0xFF007BFF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Content for "MIXED TOPICS TEST" tab
  Widget _buildMixedTopicsTestContent() {
    return Expanded(
      child: ListView(
        children: [
          _buildTestCard('CUSTOM TEST', Color(0xFF007BFF), Color(0xFF1B263B), () {
            // Navigate to Custom Test
          }),
          _buildTestCard('BEGINNER TEST', Color(0xFFFFA500), Color(0xFFFF6347), () {
            // Navigate to Beginner Test
          }),
          _buildTestCard('MEDIUM TEST', Color(0xFF32CD32), Color(0xFFFFFF00), () {
            // Navigate to Medium Test
          }),
          _buildTestCard('ADVANCED TEST', Color(0xFF007BFF), Color(0xFF1B263B), () {
            // Navigate to Advanced Test
          }),
        ],
      ),
    );
  }

  // Content for "TOPIC" tab
  Widget _buildTopicContent() {
    return Expanded(
      child: ListView(
        children: [
          _buildTopicCard('1. Noun', 'Test'),
          _buildTopicCard('2. Pronoun', 'Test'),
          _buildTopicCard('3. Verb', 'Test'),
          _buildTopicCard('4. Adverb', 'Test'),
          _buildTopicCard('5. Tenses', 'Test'),
        ],
      ),
    );
  }

  // Function to build each test card for "MIXED TOPICS TEST" tab
  Widget _buildTestCard(String title, Color startColor, Color endColor, VoidCallback onStart) {
    return GestureDetector(
      onTap: onStart,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [startColor, endColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              ElevatedButton(
                onPressed: onStart,
                child: Text('START'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Color(0xFF1B263B),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build each topic card for "TOPIC" tab
  Widget _buildTopicCard(String title, String testLabel) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Test Page when "Test" button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestPage()),
                    );
                  },
                  child: Text(testLabel.toUpperCase()),
                ),
              ],
            ),
          ],
        ),
      ),
      color: Color(0xFF1B263B), // Match the card background to the theme
    );
  }
}
