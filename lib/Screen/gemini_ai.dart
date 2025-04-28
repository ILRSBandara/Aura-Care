import 'package:flutter/material.dart';

class GeminiChatBot extends StatefulWidget {
  const GeminiChatBot({super.key});

  @override
  State<GeminiChatBot> createState() => _GeminiChatBotState();
}

class _GeminiChatBotState extends State<GeminiChatBot> {
  // ignore: non_constant_identifier_names
  TextEditingController PromptController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 147, 241, 196),
      appBar: AppBar(
        elevation: 3,
         backgroundColor: const Color.fromARGB(255, 147, 241, 196),
        title: const Text("AI Chatbot"),
        ),
       body: Column(
        children: [
          Padding(
            padding:EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  flex: 20,
                  child: TextField(
                    controller: PromptController,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      ),
                     decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter a Prompt Here"
                      ), 
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: const Color.fromARGB(255, 66, 219, 145),
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 32,
                      ),
                      ),
                  )
                  ],
                  ),
        ),
       ],
      ), 
    );
  }
}