import 'package:aura_care/Screen/doctorProfile.dart';
import 'package:flutter/material.dart';

class Doctor {
  final String
  name;
  final String
  specialty;
  final String
  imageAssetPath; // Local image path

  Doctor({
    required this.name,
    required this.specialty,
    required this.imageAssetPath, // Use local image path here
  });
}

class DoctorListScreen
    extends
        StatefulWidget {
  const DoctorListScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _DoctorListScreenState
  createState() =>
      _DoctorListScreenState();
}

class _DoctorListScreenState
    extends
        State<
          DoctorListScreen
        > {
  // Sample doctor data with local images
  final List<
    Doctor
  >
  doctors = [
    Doctor(
      name:
          "Dr. Vardh Shaneru",
      specialty:
          "Psychologists",
      imageAssetPath:
          "assets/Images/doctor4.jpg",
    ),
    Doctor(
      name:
          "Dr. Senuka Wathsal",
      specialty:
          "Psychiatrists",
      imageAssetPath:
          "assets/Images/doctor3.jpg",
    ),
    Doctor(
      name:
          "Dr. Kiyan Sadesh",
      specialty:
          "Physicians",
      imageAssetPath:
          "assets/Images/doctor5.jpg",
    ),
    Doctor(
      name:
          "Dr. Arashi Perera",
      specialty:
          "psychiatrists",
      imageAssetPath:
          "assets/Images/doctor1.jpg",
    ),
    Doctor(
      name:
          "Dr. Thomas Nikol",
      specialty:
          "Pediatric Psychiatrists",
      imageAssetPath:
          "assets/Images/doctor6.jpg",
    ),
    Doctor(
      name:
          "Dr. Shevon Dias",
      specialty:
          "Psychopharmacologists",
      imageAssetPath:
          "assets/Images/gounder.jpg",
    ),
    Doctor(
      name:
          "Dr. Mensah T",
      specialty:
          "Online directories",
      imageAssetPath:
          "assets/Images/doctor3.jpg",
    ),
    Doctor(
      name:
          "Dr. Prakash Soyza",
      specialty:
          "Psychiatric-Mental Health Nurse Practitioners (PMHNP)",
      imageAssetPath:
          "assets/Images/doctor1.jpg",
    ),
    // Add other doctors...
  ];

  List<
    Doctor
  >
  filteredDoctors =
      [];

  @override
  void
  initState() {
    super
        .initState();
    filteredDoctors =
        doctors;
  }

  // Function to filter doctors based on search input
  void
  filterDoctors(
    String
    query,
  ) {
    setState(() {
      filteredDoctors =
          doctors.where((
            doctor,
          ) {
            return doctor.name.toLowerCase().contains(
                  query.toLowerCase(),
                ) ||
                doctor.specialty.toLowerCase().contains(
                  query.toLowerCase(),
                );
          }).toList();
    });
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Doctors',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: Column(
          children: [
            // Search Bar
            TextField(
              onChanged:
                  filterDoctors,
              decoration: InputDecoration(
                hintText:
                    'Search for doctors...',
                prefixIcon: Icon(
                  Icons.search,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
            ),
            SizedBox(
              height:
                  16,
            ),
            // Doctor List
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      2,
                  crossAxisSpacing:
                      16,
                  mainAxisSpacing:
                      16,
                ),
                itemCount:
                    filteredDoctors.length,
                itemBuilder: (
                  context,
                  index,
                ) {
                  final doctor =
                      filteredDoctors[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the doctor's profile screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (
                                context,
                              ) => DoctorProfileScreen(
                                doctor:
                                    doctor,
                              ),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          16,
                        ),
                      ),
                      elevation:
                          4,
                      child: Column(
                        mainAxisAlignment:
                            MainAxisAlignment.center,
                        children: [
                          ClipOval(
                            child: Image.asset(
                              doctor.imageAssetPath, // Load local image
                              width:
                                  80,
                              height:
                                  80,
                              fit:
                                  BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height:
                                8,
                          ),
                          Text(
                            doctor.name,
                            textAlign:
                                TextAlign.center,
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          Text(
                            doctor.specialty,
                            textAlign:
                                TextAlign.center,
                            style: TextStyle(
                              fontSize:
                                  14,
                              color:
                                  Colors.blue,
                            ),
                          ),
                        ],
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
