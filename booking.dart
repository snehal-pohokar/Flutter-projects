import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/book.dart';
import 'package:healthcare_app/homescreen.dart';
import 'package:healthcare_app/navbar_screen.dart';

class Booking {
  final String patientName;
  final String patientPhone;
  final String doctorName;
  final String specialty;
  final String date;
  final String time;

  Booking({
    required this.patientName,
    required this.patientPhone,
    required this.doctorName,
    required this.specialty,
    required this.date,
    required this.time,
  });
  Map<String, dynamic> toMap() {
    return {
      'patientName': patientName,
      'patientPhone': patientPhone,
      'doctorName': doctorName,
      'specialty': specialty,
      'date': date,
      'time': time,
    };
  }
}

class BookAppointmentPage extends StatelessWidget {
  final Doctor doctor;
  final String selectedDate;
  final String selectedTime;

  const BookAppointmentPage({
    super.key,
    required this.doctor,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   title: const Text('Book Appointment'),
      // ),
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
            // leading: IconButton(
            //   icon: const Icon(Icons.arrow_back, color: Colors.white),
            //   onPressed: () {
            //       Navigator.of(context)
            //           .pushReplacement(MaterialPageRoute(builder: (context) {
            //         return const NavbarScreen ();
            //   }));
            //   },
            // ),
            title: Text(
              "Book Appointment",
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
        child: ListView(
          children: [
            const Text(
              'Confirm Booking Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Doctor: ${doctor.name}'),
            Text('Specialty: ${doctor.specialty}'),
            Text('Date: $selectedDate'),
            Text('Time: $selectedTime'),
            const SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.purple, // Start color (purple)
                    Colors.blue, // End color (blue)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius:
                    BorderRadius.circular(20), // Match button's border radius
              ),
              child: ElevatedButton(
                onPressed: () async {
                  final name = nameController.text;
                  final phone = phoneController.text;

                  if (name.isNotEmpty && phone.isNotEmpty) {
                    final booking = Booking(
                      patientName: name,
                      patientPhone: phone,
                      doctorName: doctor.name,
                      specialty: doctor.specialty,
                      date: selectedDate,
                      time: selectedTime,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DoctorDetailPage(doctor: doctor),
                      ),
                    );
                    try {
                      // Save booking to Firestore
                      await FirebaseFirestore.instance
                          .collection('bookings')
                          .add(booking.toMap());

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Appointment Confirmed'),
                          content: Text(
                              'Your appointment with ${booking.doctorName} on ${booking.date} at ${booking.time} has been booked.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const NavbarScreen()
                                  ),
                                );
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } catch (e) {
                      // Handle Firestore errors
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error booking appointment: $e'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all the details'),
                        backgroundColor: Colors.black,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Confirm Appointment',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Doc {
  final String name;
  final String specialty;

  Doc({required this.name, required this.specialty});
}
