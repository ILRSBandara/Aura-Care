import 'package:aura_care/Screen/authentication/signIn.dart';
import 'package:aura_care/Screen/authentication/userDetails.dart';
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
      TextEditingController(); 

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signUp() async {
    if (passwordController.text.trim() != rePasswordController.text.trim()) {
      _showErrorDialog("Passwords do not match!");
      return;
    }

    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => UserDetails(email: emailController.text)),
      );
    } catch (e) {

      _showErrorDialog(e.toString());
    }
  }

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
                  ), 
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
