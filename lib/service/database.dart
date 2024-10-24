import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods{
  Future<void> addUser(String userId, Map<String, dynamic> userInfoMap) async {
    try {
      await FirebaseFirestore.instance.collection("User").doc(userId).set(userInfoMap);
    } catch (e) {
      print("Error adding user: $e");
      // Optionally, show a user-friendly message to the user
    }
  }

}
class FireStoreService{
  //collections of orders
  final CollectionReference order =FirebaseFirestore.instance.collection('orders');
  


  //saving order to database
}