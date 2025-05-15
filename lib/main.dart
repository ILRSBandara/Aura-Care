// import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'chat_screen.dart'; // Import your ChatScreen

// void
// main() async {
//   WidgetsFlutterBinding.ensureInitialized(); // Add this line
//   await dotenv.load(
//     fileName:
//         ".env",
//   ); // Load .env file
//   runApp(
//     const MyApp(),
//   );
// }

// class MyApp
//     extends
//         StatelessWidget {
//   const MyApp({
//     super.key,
//   });

//   @override
//   Widget
//   build(
//     BuildContext
//     context,
//   ) {
//     return MaterialApp(
//       title:
//           'Gemini Chatbot',
//       theme: ThemeData(
//         primarySwatch:
//             Colors.blue,
//         visualDensity:
//             VisualDensity.adaptivePlatformDensity,
//         fontFamily:
//             'GoogleSans',
//       ),
//       home:
//           const ChatScreen(), // Use the ChatScreen widget
//     );
//   }
// }

import 'package:aura_care/ui/chat.dart';
import 'package:flutter/material.dart';

import 'ui/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Bot',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        ChatPage.routeName: (context) => const ChatPage(),
      },
    );
  }
}
