import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:flutter/material.dart';
import 'package:aura_care/Screen/dashboard.dart';

class SignUp
    extends
        StatefulWidget {
  const SignUp({
    super.key,
  });

  @override
  State<
    SignUp
  >
  createState() =>
      _SignUpState();
}

class _SignUpState
    extends
        State<
          SignUp
        > {
  final emailController =
      TextEditingController();
  final passwordController =
      TextEditingController();

  // Initialize FirebaseAuth
  final FirebaseAuth
  _auth =
      FirebaseAuth.instance;

  // Sign up method using Firebase Authentication
  Future<
    void
  >
  _signUp() async {
    try {
      // Create a new user with email and password
      UserCredential
      userCredential = await _auth.createUserWithEmailAndPassword(
        email:
            emailController.text.trim(),
        password:
            passwordController.text.trim(),
      );

      // If sign up is successful, navigate to the Dashboard screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (
                context,
              ) =>
                  const DashboardScreen(),
        ),
      );
    } catch (
      e
    ) {
      // Handle errors (e.g., weak password, invalid email)
      showDialog(
        context:
            context,
        builder:
            (
              context,
            ) => AlertDialog(
              title: const Text(
                'Error',
              ),
              content: Text(
                e.toString(),
              ),
              actions: <
                Widget
              >[
                TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pop();
                  },
                  child: const Text(
                    'OK',
                  ),
                ),
              ],
            ),
      );
    }
  }

  @override
  Widget
  build(
    BuildContext
    context,
  ) {
    return Scaffold(
      backgroundColor:
          Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(
          25,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            _header(),
            _inputFields(),
            _signUpButton(),
          ],
        ),
      ),
    );
  }

  _header() {
    return const Column(
      children: [
        SizedBox(
          height:
              5,
        ),
        Text(
          "Create Account",
          style: TextStyle(
            fontSize:
                32,
            fontWeight:
                FontWeight.bold,
          ),
        ),
        SizedBox(
          height:
              20,
        ),
      ],
    );
  }

  _inputFields() {
    return Column(
      children: [
        TextField(
          controller:
              emailController,
          decoration: InputDecoration(
            hintText:
                "Email",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              borderSide:
                  BorderSide.none,
            ),
            fillColor: const Color.fromARGB(
              100,
              194,
              255,
              199,
            ),
            filled:
                true,
            prefixIcon: const Icon(
              Icons.email,
            ),
          ),
        ),
        const SizedBox(
          height:
              25,
        ),
        TextField(
          controller:
              passwordController,
          decoration: InputDecoration(
            hintText:
                "Password",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
              borderSide:
                  BorderSide.none,
            ),
            fillColor: const Color.fromARGB(
              100,
              194,
              255,
              199,
            ),
            filled:
                true,
            prefixIcon: const Icon(
              Icons.lock,
            ),
          ),
          obscureText:
              true,
        ),
        const SizedBox(
          height:
              25,
        ),
      ],
    );
  }

  _signUpButton() {
    return GestureDetector(
      onTap:
          _signUp,
      child: Container(
        height:
            50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          color: const Color.fromARGB(
            255,
            17,
            139,
            80,
          ),
        ),
        child: const Center(
          child: Text(
            "Create Account",
            style: TextStyle(
              color:
                  Colors.white,
              fontSize:
                  18,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
