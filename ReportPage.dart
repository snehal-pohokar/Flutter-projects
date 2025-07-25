import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HealthDashboard extends StatelessWidget {
  const HealthDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 241, 241),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF8E44AD), // Start color (purple)
                Color(0xFF3498DB), // End color (blue)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Transparent for gradient
            elevation: 0, // Flat look
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Health dashboard",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white, // White text for contrast
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heart Rate Card
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Heart rate',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                      Text(
                        '97',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'bpm',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.show_chart,
                    size: 50,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Blood Group and Weight Cards
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.teal),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.bloodtype,
                          color: Colors.red,
                          size: 24,
                        ),
                        Text(
                          'Blood Group',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          'A+',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.teal),
                    ),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.fitness_center,
                          color: Colors.orange,
                          size: 24,
                        ),
                        Text(
                          'Weight',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          '103 lbs',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // Latest Report Section
            const Text(
              'Latest report',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            ReportCard(date: 'Jul 10, 2023'),
            ReportCard(date: 'Jul 5, 2023'),
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String date;

  ReportCard({required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.insert_drive_file,
                color: Colors.blue,
                size: 36,
              ),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'General report',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    date,
                    style: const TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.more_vert),
        ],
      ),
    );
  }
}