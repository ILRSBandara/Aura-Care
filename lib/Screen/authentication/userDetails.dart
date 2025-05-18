import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:aura_care/Screen/authentication/success.dart';
import 'package:aura_care/Screen/authentication/utils.dart';

class UserDetails extends StatefulWidget {
  final String email;

  const UserDetails({super.key, required this.email});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  Uint8List? _image;

  final TextEditingController ageEditingController = TextEditingController();
  final TextEditingController nnameEditingController = TextEditingController();
  final TextEditingController numberEditingController = TextEditingController();
  final TextEditingController addressEditingController =
      TextEditingController();
  final TextEditingController weightEditingController = TextEditingController();
  void selectImage() async {
    List<int> img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img as Uint8List?;
    });
  }

  Future<void> save() async {
    String email = widget.email;
    String age = ageEditingController.text;
    String nname = nnameEditingController.text;
    String number = numberEditingController.text;
    String address = addressEditingController.text;
    String weight = weightEditingController.text;

    if (age.isEmpty || nname.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Age and Name cannot be empty")),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('UserDetails').add({
        'email': email,
        'age': age,
        'name': nname,
        'number': number,
        'address': address,
        'weight': weight,
      });

      ageEditingController.clear();
      nnameEditingController.clear();
      numberEditingController.clear();
      addressEditingController.clear();
      weightEditingController.clear();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Success()),
      );
    } catch (e) {
      print('Error saving data: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                const Text(
                  "Enter Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                        : const CircleAvatar(
                          radius: 64,
                          backgroundImage: AssetImage('assets/Images/user.png'),
                        ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: selectImage,
                        icon: const Icon(Icons.add_a_photo),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                buildTextField(nnameEditingController, 'Enter Your Name'),
                const SizedBox(height: 20),
                buildTextField(ageEditingController, 'Enter Your Age'),
                const SizedBox(height: 20),
                buildTextField(
                  weightEditingController,
                  'Enter Your Weight (kg)',
                ),
                const SizedBox(height: 20),
                buildTextField(
                  numberEditingController,
                  'Enter Your Telephone Number',
                ),
                const SizedBox(height: 20),
                buildMultilineField(
                  addressEditingController,
                  'Enter Your Address',
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 31, 171, 137),
                    ),
                    onPressed: save,
                    child: const Text(
                      '    Next    ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String hint) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(10.0),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildMultilineField(TextEditingController controller, String hint) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white),
      ),
      child: TextField(
        maxLines: null,
        expands: true,
        keyboardType: TextInputType.multiline,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: const EdgeInsets.all(10.0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
