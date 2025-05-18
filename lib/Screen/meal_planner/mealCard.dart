// import 'package:flutter/material.dart';

// class MealCard extends StatelessWidget {
//   final String mealName;
//   final String mealTime;
//   final int calories;
//   final String imageUrl;

//   const MealCard({
//     super.key,
//     required this.mealName,
//     required this.mealTime,
//     required this.calories,
//     required this.imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 4,
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(16),
//               bottomLeft: Radius.circular(16),
//             ),
//             child: Image.network(
//               imageUrl,
//               width: 100,
//               height: 100,
//               fit: BoxFit.cover,
//               errorBuilder: (context, error, stackTrace) =>
//                   const Icon(Icons.fastfood, size: 60),
//             ),
//           ),
//           const SizedBox(width: 16),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(mealName,
//                       style: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold)),
//                   Text('Time: $mealTime'),
//                   Text('Calories: $calories kcal'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
