import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ChatBot extends StatefulWidget {
  static const routeName = '/chat';
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _chatHistory = [];

  void getAnswer() async {
    final url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=AIzaSyBTI4bEWDsI0geotzHsG_OH801ROfCMAjk";
    final uri = Uri.parse(url);

    // Build the message from chat history
    List<Map<String, dynamic>> parts = [];
    for (var i = 0; i < _chatHistory.length; i++) {
      parts.add({"text": _chatHistory[i]["message"]});
    }

    Map<String, dynamic> request = {
      "contents": [
        {"parts": parts},
      ],
    };

    final response = await http.post(
      uri,
      body: jsonEncode(request),
      headers: {'Content-Type': 'application/json'},
    );

    final data = json.decode(response.body);

    if (response.statusCode == 200 && data["candidates"] != null) {
      setState(() {
        _chatHistory.add({
          "time": DateTime.now(),
          "message": data["candidates"][0]["content"]["parts"][0]["text"],
          "isSender": false,
        });
      });
    } else {
      print("API Error: ${response.body}");
      setState(() {
        _chatHistory.add({
          "time": DateTime.now(),
          "message": "Error: Unable to get response from API.",
          "isSender": false,
        });
      });
    }

    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Chatbot",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 260,
            child: ListView.builder(
              itemCount: _chatHistory.length,
              shrinkWrap: false,
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 8,
                    bottom: 8,
                  ),
                  child: Align(
                    alignment:
                        (_chatHistory[index]["isSender"]
                            ? Alignment.topRight
                            : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: const Offset(0, 0),
                          ),
                        ],
                        color:
                            (_chatHistory[index]["isSender"]
                                ? Color.fromRGBO(194, 255, 199, 1.0)
                                : Colors.white),
                      ),
                      padding: EdgeInsets.all(14),
                      child: Text(
                        _chatHistory[index]["message"],
                        style: TextStyle(
                          fontSize: 14,
                          color:
                              _chatHistory[index]["isSender"]
                                  ? Colors.black
                                  : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 8.0,
              ),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        border: GradientBoxBorder(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.green, Colors.blue],
                          ),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Ask your health question",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          controller: _chatController,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // MaterialButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       if (_chatController.text.isNotEmpty) {
                  //         _chatHistory.add({
                  //           "time": DateTime.now(),
                  //           "message": _chatController.text,
                  //           "isSender": true,
                  //         });
                  //         _chatController.clear();
                  //       }
                  //     });
                  //     _scrollController.jumpTo(
                  //       _scrollController.position.maxScrollExtent,
                  //     );

                  //     getAnswer();
                  //   },
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(50.0),
                  //   ),
                  //   padding: const EdgeInsets.all(0.0),
                  //   child: Ink(
                  //     decoration: const BoxDecoration(
                  //       gradient: LinearGradient(
                  //         begin: Alignment.topLeft,
                  //         end: Alignment.bottomRight,
                  //         colors: [Colors.green, Colors.blue],
                  //       ),
                  //       borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  //     ),
                  //     child: Container(
                  //       constraints: const BoxConstraints(
                  //         minWidth: 46.0,
                  //         minHeight: 36.0,
                  //       ),
                  //       alignment: Alignment.center,
                  //       child: const Icon(
                  //         Icons.arrow_upward,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.zero, // Ensure no margin from parent
                    padding: EdgeInsets.zero, // Ensure no padding from parent
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          if (_chatController.text.isNotEmpty) {
                            _chatHistory.add({
                              "time": DateTime.now(),
                              "message": _chatController.text,
                              "isSender": true,
                            });
                            _chatController.clear();
                          }
                        });
                        _scrollController.jumpTo(
                          _scrollController.position.maxScrollExtent,
                        );
                        getAnswer();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      padding: EdgeInsets.zero, // Remove internal padding
                      minWidth: 0, // Optional: prevents default minimum width
                      height: 0, // Optional: prevents default minimum height
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Colors.green, Colors.blue],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                            minWidth: 46.0,
                            minHeight: 36.0,
                          ),
                          alignment: Alignment.center,
                          child: const Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
