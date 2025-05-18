import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String email;

  const UserProfile({super.key, required this.email});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic>? userData;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    fetchUserData(widget.email);
  }

  Future<void> fetchUserData(String email) async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance
              .collection('UserDetails')
              .where('email', isEqualTo: email)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        final data = querySnapshot.docs.first.data();
        userData = data;

        nameController.text = data['name'] ?? '';
        ageController.text = data['age'] ?? '';
        weightController.text = data['weight'] ?? '';
        addressController.text = data['address'] ?? '';

        setState(() {});
      } else {
        userData = null;
        setState(() {});
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error fetching data: $e')));
    }
  }

  Future<void> updateUserData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance
              .collection('UserDetails')
              .where('email', isEqualTo: widget.email)
              .get();

      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs.first.id;

        await FirebaseFirestore.instance
            .collection('UserDetails')
            .doc(docId)
            .update({
              'name': nameController.text,
              'age': ageController.text,
              'weight': weightController.text,
              'address': addressController.text,
            });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );

        setState(() => isEditing = false);
        fetchUserData(widget.email);
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Update failed: $e')));
    }
  }

  Widget buildProfileField({
    required IconData icon,
    required String label,
    String? value,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(label),
      subtitle:
          value != null && value.isNotEmpty
              ? Text(value)
              : const Text('Not provided'),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      return Scaffold(
        appBar: AppBar(title: const Text("User Profile")),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: const AssetImage("assets/Images/user.jpg"),
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(height: 10),

              // Editable Name with edit icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child:
                        isEditing
                            ? TextField(
                              controller: nameController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Enter Name',
                              ),
                            )
                            : Text(
                              userData!['name'] ?? 'No Name',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      isEditing ? Icons.cancel : Icons.edit,
                      color: isEditing ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      if (isEditing) {
                        showDialog(
                          context: context,
                          builder:
                              (_) => AlertDialog(
                                title: const Text('Cancel Editing'),
                                content: const Text('Discard changes?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        isEditing = false;
                                        fetchUserData(widget.email);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Yes'),
                                  ),
                                ],
                              ),
                        );
                      } else {
                        setState(() => isEditing = true);
                      }
                    },
                  ),
                ],
              ),
              buildProfileField(
                icon: Icons.phone,
                label: "Phone",
                value: userData!['number'],
              ),
              buildProfileField(
                icon: Icons.email,
                label: "Email",
                value: userData!['email'],
              ),

              // Age field editable only if editing
              ListTile(
                leading: const Icon(Icons.calendar_today, color: Colors.green),
                title: const Text("Age"),
                subtitle:
                    isEditing
                        ? TextField(
                          controller: ageController,
                          decoration: const InputDecoration(
                            hintText: 'Enter age',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        )
                        : Text(userData!['age'] ?? ''),
              ),

              // Weight field editable only if editing
              ListTile(
                leading: const Icon(Icons.monitor_weight, color: Colors.green),
                title: const Text("Weight"),
                subtitle:
                    isEditing
                        ? TextField(
                          controller: weightController,
                          decoration: const InputDecoration(
                            hintText: 'Enter weight',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                          ),
                          keyboardType: TextInputType.number,
                        )
                        : Text(userData!['weight'] ?? ''),
              ),

              // Address field editable only if editing
              ListTile(
                leading: const Icon(Icons.location_on, color: Colors.green),
                title: const Text("Address"),
                subtitle:
                    isEditing
                        ? TextField(
                          controller: addressController,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            hintText: 'Enter address',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                          ),
                        )
                        : Text(userData!['address'] ?? ''),
              ),

              // Show Save Changes button only when editing
              if (isEditing)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton.icon(
                    onPressed: updateUserData,
                    icon: const Icon(Icons.save),
                    label: const Text("Save Changes"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 12,
                      ),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
