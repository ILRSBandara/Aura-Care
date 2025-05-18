// import 'package:flutter/material.dart';
// import 'gemini_api.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final TextEditingController _controller = TextEditingController();
//   List<Map<String, String>> messages = [];

//   void _sendMessage() async {
//     final userInput = _controller.text;
//     if (userInput.isEmpty) return;

//     setState(() {
//       messages.add({"role": "user", "text": userInput});
//       _controller.clear();
//     });

//     final response = await GeminiAPI.sendMessage(userInput);

//     setState(() {
//       messages.add({"role": "gemini", "text": response});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Gemini Chatbot")),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 final msg = messages[index];
//                 return ListTile(
//                   title: Text(msg['text']!),
//                   subtitle: Text(msg['role'] == 'user' ? 'You' : 'Gemini'),
//                   tileColor:
//                       msg['role'] == 'user' ? Colors.blue[50] : Colors.grey[200],
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: InputDecoration(hintText: "Type a message"),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
