import 'package:aveosoft_tech/model/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
final CollectionReference _usersCollection =
    _firebaseFirestore.collection('users');

class DbStore {
  static String? userId;

  static Future<void> writeUserData(UserModel user) async {
    _usersCollection
        .doc(userId)
        .set(user.toMap())
        .whenComplete(() => print("Stored the data."))
        .catchError((e) => print(e));
  }

  static Stream<DocumentSnapshot> readUserDataStream() {
    return _usersCollection.doc(userId).snapshots();
  }
}
