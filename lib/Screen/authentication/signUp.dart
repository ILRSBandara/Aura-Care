import 'package:aura_care/Screen/authentication/signIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController =
      TextEditingController(); // Re-enter password controller

  // Initialize FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up method using Firebase Authentication
  Future<void> _signUp() async {
    // Check if passwords match
    if (passwordController.text.trim() != rePasswordController.text.trim()) {
      _showErrorDialog("Passwords do not match!");
      return;
    }

    try {
      // Create a new user with email and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      // If sign up is successful, navigate to the Dashboard screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
      );
    } catch (e) {
      // Handle errors (e.g., weak password, invalid email)
      _showErrorDialog(e.toString());
    }
  }

  // Method to show error dialog
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  // @override
  // Widget
  // build(
  //   BuildContext
  //   context,
  // ) {
  //   return Scaffold(
  //     backgroundColor:
  //         Colors.white,
  //     body: SingleChildScrollView(
  //       child: Padding(
  //         padding: const EdgeInsets.only(
  //           left:
  //               25,
  //           right:
  //               25,
  //           top:
  //               100,
  //         ),
  //         child: Column(
  //           children: [
  //             _header(),
  //             _log(),
  //             _inputFields(),
  //             _signUpButton(),
  //             _loginRedirect(),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 100),
                child: Column(
                  children: [
                    _header(),
                    _log(),
                    _inputFields(),
                    _signUpButton(),
                    _loginRedirect(),
                  ],
                ),
              ),
            ),
          ),
          _bot(context),
        ],
      ),
    );
  }

  // Header with logo and name
  _header() {
    return const Column(
      children: [
        SizedBox(height: 5),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Create",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              TextSpan(
                text: " Account",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  _log() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Image.asset(
            'assets/Images/auraCareMainLogo.png',
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  // Input fields for email, password, and re-enter password
  _inputFields() {
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            hintText: "Your Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color.fromARGB(100, 194, 255, 199),
            filled: true,
            prefixIcon: const Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 25),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Your Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color.fromARGB(100, 194, 255, 199),
            filled: true,
            prefixIcon: const Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 25),
        TextField(
          controller: rePasswordController,
          decoration: InputDecoration(
            hintText: "Re-enter Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color.fromARGB(100, 194, 255, 199),
            filled: true,
            prefixIcon: const Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 25),
      ],
    );
  }

  // Sign up button
  _signUpButton() {
    return GestureDetector(
      onTap: _signUp,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 17, 139, 80),
        ),
        child: const Center(
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Redirect to LogIn screen if already have an account
  _loginRedirect() {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account?"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignIn(),
                  ), // Navigate to LogIn screen
                );
              },
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 15, color: Colors.green),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _bot(context) {
    return const Column(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'From',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aura',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      'Care',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
