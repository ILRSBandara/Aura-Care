import 'package:aura_care/Screen/model.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:intl/intl.dart';


class GeminiChatBot extends StatefulWidget {
  const GeminiChatBot({super.key});
  @override
  State<GeminiChatBot> createState() => _GeminiChatBotState();
}

class _GeminiChatBotState extends State<GeminiChatBot> {
  // ignore: non_constant_identifier_names
  TextEditingController PromptController = TextEditingController();
  static const apiKey = "AIzaSyC7Q7OrHoSofUeg99-HZGz5bkmQq6TKOHE";
  final model = GenerativeAiModel(modelName: "gemini-pro", apiKey: apiKey); // Replace with the correct parameter name

// ignore: non_constant_identifier_names
final List<ModelMessage> Prompt = [];
Future<void> sendMessage()async { 
  final message = PromptController.text;
  //for prompt
  setState(() {
    PromptController.clear();
    Prompt.add(
      ModelMessage(
        isPrompt: true, 
        message: message, 
        time: DateTime.now(),
      ),
    );
  });
  //for respond
  final content = [Content.text(message)];
  final response = await model.generateContent(content);
  setState(() {
    Prompt.add(
      ModelMessage(
        isPrompt: false, 
        message: response.text ?? "", 
        time: DateTime.now(),
      ),
    );
  });
} 

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
          Expanded(
            child: ListView.builder(
              itemCount:Prompt.length ,
              itemBuilder: (context, index) {
                final message = Prompt[index];
                return UserPrompt(
                  isPrompt: message.isPrompt, 
                  message: message.message, 
                  date: DateFormat('hh:mm a').format(
                    message.time,
                    ),);
              },
            ),
          ),
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
                    onTap: () {
                      sendMessage();
                     },
                  child: CircleAvatar(
                    radius: 29,
                    backgroundColor: const Color.fromARGB(255, 2, 199, 104),
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

  // ignore: non_constant_identifier_names
  Container UserPrompt({
    required final bool isPrompt,
    required String message, 
    required String date,
    }) {
    return Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 15).copyWith(
                  left: isPrompt ? 80 : 15,
                  right: isPrompt ? 15 : 80
                  ),
                decoration: BoxDecoration(
                color: isPrompt ?Colors.green:Colors.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: isPrompt ? Radius.circular(20) : Radius.zero,
                ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // for prompt and respond
                    Text(
                      message,
                      style: TextStyle(
                        fontWeight: isPrompt  
                        ? FontWeight.bold 
                        : FontWeight.normal,
                        fontSize: 18,
                        color: isPrompt 
                        ? Colors.white
                        :Colors.black, 
                        ),
                        ),
                        //for prompt and respond time
                        Text(
                      date,
                      style: TextStyle(
                        
                        fontSize: 14,
                        color: isPrompt 
                        ? Colors.white
                        :Colors.black, 
                        ),
                        ),
                   ],
                ),
              );
  }
}

class GenerativeAiModel {
  final String modelName;
  final String apiKey;

  GenerativeAiModel({required this.modelName, required this.apiKey});
  
  generateContent(List<Content> content) {}
}

