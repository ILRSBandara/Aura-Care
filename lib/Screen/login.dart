import 'package:aura_care/Screen/menu.dart';
import 'package:aura_care/Screen/signup.dart'; // Import SignUp screen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:aura_care/Screen/dashboard.dart';

class LogIn
    extends
        StatefulWidget {
  const LogIn({
    super.key,
  });

  @override
  State<
    LogIn
  >
  createState() =>
      _SignInState();
}

class _SignInState
    extends
        State<
          LogIn
        > {
  final emailController =
      TextEditingController();
  final passwordController =
      TextEditingController();

  final FirebaseAuth
  _auth =
      FirebaseAuth.instance;

  Future<
    void
  >
  _signIn() async {
    try {
      UserCredential
      userCredential = await _auth.signInWithEmailAndPassword(
        email:
            emailController.text.trim(),
        password:
            passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (
                context,
              ) =>
              DashboardScreen(emaill: emailController.text.trim()),
        ),
      );
    } catch (
      e
    ) {
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
      resizeToAvoidBottomInset:
          false,
      body: Column(
        children: [
          Expanded(
            flex:
                1,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left:
                      25,
                  right:
                      25,
                  top:
                      100,
                ),
                child: Column(
                  children: [
                    _header(
                      context,
                    ),
                    _log(
                      context,
                    ),
                    _inputField(
                      context,
                    ),
                  ],
                ),
              ),
            ),
          ),
          _bot(
            context,
          ),
        ],
      ),
    );
  }

  _header(
    context,
  ) {
    return const Column(
      children: [
        SizedBox(
          height:
              5,
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text:
                    "Welcome",
                style: TextStyle(
                  fontSize:
                      34,
                  fontWeight:
                      FontWeight.bold,
                  color:
                      Colors.green,
                ),
              ),
              TextSpan(
                text:
                    " Back",
                style: TextStyle(
                  fontSize:
                      34,
                  fontWeight:
                      FontWeight.bold,
                  color:
                      Colors.black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height:
              20,
        ),
      ],
    );
  }

  _log(
    context,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom:
                30,
          ),
          child: Image.asset(
            'assets/Images/auraCareMainLogo.png',
            height:
                120,
            fit:
                BoxFit.cover,
          ),
        ),
      ],
    );
  }

  _inputField(
    context,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.stretch,
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
              Icons.person,
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
        GestureDetector(
          onTap:
              _signIn,
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
                "Login",
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
        ),
        const SizedBox(
          height:
              15,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (
                          context,
                        ) =>
                            const SignUp(),
                  ), // Navigate to SignUp screen
                );
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize:
                      15,
                  color:
                      Colors.green,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height:
              15,
        ),
      ],
    );
  }

  _bot(
    context,
  ) {
    return const Column(
      children: [
        Align(
          alignment:
              Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom:
                  30,
            ),
            child: Column(
              mainAxisSize:
                  MainAxisSize.min,
              children: [
                Text(
                  'From',
                  style: TextStyle(
                    fontSize:
                        14,
                    fontWeight:
                        FontWeight.bold,
                    color:
                        Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text(
                      'Aura',
                      style: TextStyle(
                        fontSize:
                            18,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Colors.green,
                      ),
                    ),
                    Text(
                      'Care',
                      style: TextStyle(
                        fontSize:
                            18,
                        fontWeight:
                            FontWeight.bold,
                        color:
                            Colors.black,
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
