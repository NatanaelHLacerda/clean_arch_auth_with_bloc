import 'package:clean_arch_auth_with_bloc/features/register/data/datasources/register_datasources.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterDataSourcesImpl implements RegisterDataSources {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Future signUp(String email, String password) async {
//  -->  (Login)    auth.signInWithEmailAndPassword(email: email, password: password);

    return await auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
