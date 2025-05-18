// import 'package:flutter/material.dart';

// class ProfileDisplayData extends StatefulWidget {
//   const ProfileDisplayData({super.key});

//   @override
//   _ProfileDisplayDataState createState() => _ProfileDisplayDataState();
// }

// class _ProfileDisplayDataState extends State<ProfileDisplayData> {
//   // Sample static data
//   final Map<String, dynamic> userDate = {
//     'name': 'Kasuni Madara',
//     'imageLink': 'assets/Images/girl.png',
//     'age': '20',
//     'email': 'kasuniMadara2000@gamail.com',
//     'number': '+94 77 1234567',
//     'address': '123, Klpana Mawatha, Dehiwala',
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile Details"),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           child: Column(
//             children: [
//               // Square Profile Picture & Name
//               Column(
//                 children: [
//                   Container(
//                     width: 150,
//                     height: 150,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                         10,
//                       ), // Optional: round corners
//                       image: DecorationImage(
//                         image: AssetImage(userDate['imageLink']),
//                         fit: BoxFit.cover,
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           blurRadius: 8,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Text(
//                     userDate['name'],
//                     style: const TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),

//               // Details Container
//               Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(16),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.3),
//                       blurRadius: 10,
//                       offset: const Offset(0, 4),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     detailTitle(
//                       "       PERSONAL DETAILS       ",
//                       color: Colors.green,
//                     ),
//                     detailItem("Age", userDate['age']),
//                     detailItem("Email", userDate['email']),
//                     detailItem("Mobile Number", userDate['number']),
//                     detailItem("Address", userDate['address']),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // Logout Button
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     padding: const EdgeInsets.symmetric(vertical: 14),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context); // Simulate logout
//                   },
//                   child: const Text(
//                     "Logout",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget detailTitle(String title, {Color color = Colors.black}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Text(
//         title,
//         style: TextStyle(
//           fontSize: 22,
//           fontWeight: FontWeight.bold,
//           color: color,
//         ),
//       ),
//     );
//   }

//   Widget detailItem(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 14.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.w600,
//               color: Colors.black87,
//             ),
//           ),
//           Text(
//             value,
//             style: const TextStyle(fontSize: 16, color: Colors.black54),
//           ),
//         ],
//       ),
//     );
//   }
// }
