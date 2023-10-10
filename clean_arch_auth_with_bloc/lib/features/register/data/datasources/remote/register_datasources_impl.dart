import 'package:clean_arch_auth_with_bloc/features/register/data/datasources/register_datasources.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterDataSourcesImpl implements RegisterDataSources {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future signUp(String email, String password) async {
    final futureUser = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    // if (futureUser.user != null) {
    //   final doc = users.doc();

    //   await doc.set({
    //     'email': email,
    //     'password': password,
    //     'id': futureUser.user!.uid,
    //   });
    // }

    return null;
  }
}
