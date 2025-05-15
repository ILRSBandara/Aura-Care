// import 'package:flutter/material.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:intl/intl.dart';

// class GeminiChatBot extends StatefulWidget {
//   const GeminiChatBot({Key? key}) : super(key: key);

//   @override
//   State<GeminiChatBot> createState() => _GeminiChatBotState();
// }

// class _GeminiChatBotState extends State<GeminiChatBot> {
//   final TextEditingController promptController = TextEditingController();
//   final List<_ChatMessage> messages = [];

//   // 🔑 Replace with your actual Gemini API key from AI Studio
//   static const String apiKey = 'AIzaSyBc472IG4PLQ2M4gkj8l9D41GXpYOeXdOc';

//   final GenerativeModel model = GenerativeModel(
//     model: 'gemini-pro',
//     apiKey: apiKey,
//   );

//   Future<void> sendMessage() async {
//     final input = promptController.text.trim();
//     if (input.isEmpty) return;

//     setState(() {
//       messages.add(_ChatMessage(isUser: true, text: input, time: DateTime.now()));
//       promptController.clear();
//     });

//     try {
//       final response = await model.generateContent([Content.text(input)]);

//       setState(() {
//         messages.add(
//           _ChatMessage(
//             isUser: false,
//             text: response.text ?? 'No response received.',
//             time: DateTime.now(),
//           ),
//         );
//       });
//     } catch (e) {
//       setState(() {
//         messages.add(
//           _ChatMessage(
//             isUser: false,
//             text: '❌ API Error: ${e.toString()}',
//             time: DateTime.now(),
//           ),
//         );
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       appBar: AppBar(
//         title: const Text("AI ChatBot"),
//         backgroundColor: Colors.blue[100],
//         elevation: 2,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.all(8),
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final msg = messages[index];
//                 return Align(
//                   alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: msg.isUser ? Colors.green : Colors.grey[300],
//                       borderRadius: BorderRadius.only(
//                         topLeft: const Radius.circular(16),
//                         topRight: const Radius.circular(16),
//                         bottomLeft: Radius.circular(msg.isUser ? 16 : 0),
//                         bottomRight: Radius.circular(msg.isUser ? 0 : 16),
//                       ),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           msg.text,
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: msg.isUser ? Colors.white : Colors.black,
//                             fontWeight: msg.isUser ? FontWeight.bold : FontWeight.normal,
//                           ),
//                         ),
//                         const SizedBox(height: 5),
//                         Text(
//                           DateFormat('hh:mm a').format(msg.time),
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: msg.isUser ? Colors.white70 : Colors.black54,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: promptController,
//                     style: const TextStyle(fontSize: 18),
//                     decoration: InputDecoration(
//                       hintText: "Enter a prompt here",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 GestureDetector(
//                   onTap: sendMessage,
//                   child: const CircleAvatar(
//                     radius: 28,
//                     backgroundColor: Colors.green,
//                     child: Icon(Icons.send, color: Colors.white, size: 28),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ChatMessage {
//   final bool isUser;
//   final String text;
//   final DateTime time;

//   _ChatMessage({
//     required this.isUser,
//     required this.text,
//     required this.time,
//   });
// }
