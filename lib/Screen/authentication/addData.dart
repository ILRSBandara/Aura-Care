import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StoreData {
  Future<String> saveData({
    required String age,
    required String nname,
    required String number,
    required String address,
    required String email,
    required String weight, // 👈 Added weight parameter
  }) async {
    try {
      if (age.isNotEmpty && nname.isNotEmpty) {
        await _firestore.collection('UserDetails').add({
          'email': email,
          'age': age,
          'name': nname,
          'number': number,
          'address': address,
          'weight': weight, // 👈 Save weight to Firestore
        });
        return 'success';
      } else {
        return 'Age and Name cannot be empty';
      }
    } catch (error) {
      print("Error saving data: $error");
      return "Some Error";
    }
  }
}
