import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<User?> ensureAnonSignIn() async {
    try {
      if (auth.currentUser != null) return auth.currentUser;
      final cred = await auth.signInAnonymously();
      return cred.user;
    } catch (_) {
      return null;
    }
  }
}
