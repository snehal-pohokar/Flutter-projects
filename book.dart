import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/booking.dart';



class Specifictions{
  final String img;
  final String title;
  final List<Doctor> doctorList;

  Specifictions({
    required this.img,required this.title,required this.doctorList
    
  });
Map<String, dynamic> specifictionsMap() {
      return{
      "img":img,
       "title":title,
      "doctorList":doctorList,

     };
    }

}
class Doctor {
  final String name;
  final String specialty;
  final String experience;
  final int approvalRate;
  final int patientReviews;
  final String clinicTime;
  final String appointmentLink;
  final String image;

  Doctor({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.approvalRate,
    required this.patientReviews,
    required this.clinicTime,
    required this.appointmentLink,
    required this.image,
  });

  Map<String,dynamic> doctorMap(){
    return {
      "name":name,
      "speciality":specialty,
      "experience":experience,
      "approvalRate":approvalRate,
      "PReviw":patientReviews,
      "clinicTime":clinicTime,
      "appLink":appointmentLink,
      "image":image
    };
  }
}

class HealthcareApp extends StatefulWidget {
  final List<Doctor> doctorList;

  const HealthcareApp({super.key,required this.doctorList});


  @override
  State createState() => _HealthcareAppState();
}

class _HealthcareAppState extends State<HealthcareApp> {
 

  List<Doctor> filteredDoctors = [];
  final TextEditingController _searchController = TextEditingController();

  @override
 void initState(){
    super.initState();
    log("INIT STATE ${widget.doctorList}");

  }

  // void _filterDoctors(String query) {
  //   List<Doctor> results = doctors.where((doctor) =>
  //   doctor.name.toLowerCase().contains(query.toLowerCase())) .toList();
    
   
  //   results.sort((a, b) => a.name.toLowerCase().indexOf(query.toLowerCase()).compareTo(b.name.toLowerCase().indexOf(query.toLowerCase())));

  //   setState(() {
  //     filteredDoctors = results;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color.fromARGB(255, 227, 241, 241),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple, // Start color (purple)
                Colors.blue, // End color (blue)
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
              "Find Your Health Concern",
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
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              // onChanged: _filterDoctors,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                hintText: "Search Doctor",
                hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Color.fromARGB(255, 243, 238, 238),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: widget.doctorList.length,
                itemBuilder: (context, index) {
                  final doctor = widget.doctorList[index];
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: Colors.grey,  
                       width: 1,             
                      ),
                    ),
                    
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          // NAVIGATOR
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DoctorDetailPage(doctor: doctor),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            ///////
                             Container(
                              padding: const EdgeInsets.all(8), 
                              decoration: BoxDecoration(
  
                               borderRadius: BorderRadius.circular(8), 
                               border: Border.all(
                                  color: const Color.fromARGB(255, 250, 248, 248), 
                                  width: 2, 
                                 ),
                               
                                ),
                               child: Image.asset(
                               doctor.image, 
                                width: 90, 
                                height: 80, 
                                fit: BoxFit.cover, 
                                ),
                               ),
                            
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    doctor.name,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromARGB(255, 84, 84, 84),
                                    ),
                                  ),
                                  Text(
                                    doctor.specialty,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: const Color.fromARGB(255, 84, 84, 84),
                                    ),
                                  ),
                                  Text(
                                    doctor.experience,
                                    style: GoogleFonts.quicksand(
                                      fontSize: 15,
                                      color: const Color.fromARGB(255, 84, 84, 84),
                                    ),
                                  ),
                                  const Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.amberAccent),
                                    Text('4.7'),
                                     SizedBox(width: 10),
                                     Icon(Icons.location_pin,color: Colors.grey),
                                     Text('• 800m away'),
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Passing a sample doctor to the DoctorDetailPage.
    final doctor = Doctor(
      name: "Dr. Amol Bhandkar",
      specialty: "Cardiologist",
      experience: "21 years",
      approvalRate: 96,
      patientReviews: 473,
      clinicTime: "Mon-Fri: 10AM - 5PM",
      appointmentLink: "",
      image: "assets/Dr.Amol.jpeg",
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoctorDetailPage(doctor: doctor),
    );
  }
}

class DoctorDetailPage extends StatefulWidget {
  final Doctor doctor; 

  const DoctorDetailPage({super.key, required this.doctor});

  @override
  State createState() => _DoctorDetailPageState();
}

class _DoctorDetailPageState extends State<DoctorDetailPage> {
  String selectedDate = 'Wed\n23';
  String selectedTime = '02:00 PM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color.fromARGB(255, 245, 252, 252),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple, // Start color (purple)
                Colors.blue, // End color (blue)
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
              "doctor detail",
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
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(widget.doctor.image), 
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.doctor.name, 
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(widget.doctor.specialty),
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text('4.7'),
                        SizedBox(width: 10),
                        Text('• 800m away'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'About',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'A doctor is a medical professional who diagnoses, treats, and prevents illnesses, offering care through medications, procedures, and advice to maintain health.',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            const Text(
              'Read more',
              style: TextStyle(color: Colors.teal),
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8,width: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _dateButton('Tues\n26'),
                _dateButton('Wed\n27'),
                _dateButton('Thus\n28'),
                _dateButton('Fri\n29'),
                _dateButton('Sat\n30'),
                _dateButton('Sun\n1'),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Select Time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _timeButton('09:00 AM'),
                _timeButton('10:00 AM'),
                _timeButton('11:00 AM'),
                _timeButton('01:00 PM'),
                _timeButton('02:00 PM'),
                _timeButton('03:00 PM'),
                _timeButton('04:00 PM'),
                _timeButton('07:00 PM'),
                _timeButton('08:00 PM'),
              ],
            ),
            const SizedBox(height: 24),
            Container(
               decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF8E44AD), // Start color (purple)
                Color(0xFF3498DB), // End color (blue)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20), // Match button's border radius
          ),
              child: ElevatedButton(
                onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                          builder: (context) => BookAppointmentPage(  
                          doctor: widget.doctor, 
                                  selectedDate: selectedDate, 
                                  selectedTime: selectedTime, 
                        ),
                      ),
                    );
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
                  'Book Appointment',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dateButton(String day) {
    final isSelected = day == selectedDate;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = day;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          day,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _timeButton(String time) {
    final isSelected = time == selectedTime;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = time;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          time,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
