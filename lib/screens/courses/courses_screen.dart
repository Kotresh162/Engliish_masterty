import 'package:flutter/material.dart';
import 'package:login_signup/screens/courses/video_screen.dart';

class GraphicDesignScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Handle back press
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Suggested Videos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildFeaturedCourses(context),
              SizedBox(height: 24),
              Text(
                'All Courses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildAllCourses(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedCourses(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCourseCard(
            context: context,
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Advance Diploma in Graphic Design',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoScreen(),
                ),
              );
            },
            rating: 5.0,
          ),
          SizedBox(width: 16),
          _buildCourseCard(
            context: context,
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Certificate in Graphic Design',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoScreen(),
                ),
              );
            },
            rating: 5.0,
          ),
          SizedBox(width: 16),
          _buildCourseCard(
            context: context,
            imageUrl: 'https://via.placeholder.com/150',
            title: 'Certificate in Graphic Design',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoScreen(),
                ),
              );
            },
            rating: 5.0,
          ),
        ],
      ),
    );
  }

  Widget _buildAllCourses(BuildContext context) {
    return Column(
      children: [
        _buildCourseItem(
          context: context,
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Advance Diploma in Graphic Design',
          rating: 5.0,
          lessons: '15 Lessons',
          duration: '30 Hrs',
        ),
        SizedBox(height: 16),
        _buildCourseItem(
          context: context,
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Certificate in Graphic Design',
          rating: 5.0,
          lessons: '15 Lessons',
          duration: '30 Hrs',
        ),
        SizedBox(height: 16),
        _buildCourseItem(
          context: context,
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Graduate Diploma Program in Graphic Design',
          rating: 5.0,
          lessons: '15 Lessons',
          duration: '30 Hrs',
        ),
        SizedBox(height: 16),
        _buildCourseItem(
          context: context,
          imageUrl: 'https://via.placeholder.com/150',
          title: 'Graduate Diploma Program in Graphic Design',
          rating: 5.0,
          lessons: '15 Lessons',
          duration: '30 Hrs',
        ),
      ],
    );
  }

  Widget _buildCourseCard({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required double rating,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap, // Ensure onTap is connected
      child: Container(
        width: 200,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseItem({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required double rating,
    required String lessons,
    required String duration,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(lessons),
                  Text(duration),
                  SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
