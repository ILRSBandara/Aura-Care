import 'package:aura_care/Screen/dashboard.dart';
import 'package:aura_care/Screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aura Care',
      home: const DashboardScreen(emaill: 'hello@gmail.com'),
    );
  }
}


// import 'package:aura_care/ui/chat.dart';
// import 'package:flutter/material.dart';

// import 'ui/home.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chat Bot',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
//         useMaterial3: true,
//       ),
//       initialRoute: HomePage.routeName,
//       routes: {
//         HomePage.routeName: (context) => const HomePage(),
//         ChatPage.routeName: (context) => const ChatPage(),
//       },
//     );
//   }
// }