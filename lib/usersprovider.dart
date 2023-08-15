import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsersProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _usersData = [];

  List<Map<String, dynamic>> get usersData => _usersData;

  Future<void> fetchData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('Users').get();
      _usersData = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      notifyListeners();
    } catch (error) {
      print('$error');
    }
  }
}
