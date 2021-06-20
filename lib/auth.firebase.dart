import 'package:firebase_auth/firebase_auth.dart';
// Models
import 'package:newrock/models/root.model.dart';


FirebaseAuth auth = FirebaseAuth.instance;


Future<void> firebaseAuthStateChanges() {
  FirebaseAuth.instance
      .authStateChanges()
      .listen((user) {

    if (user == null) {
      print('FIREBASE | User is currently signed out!');
      store.auth.logOut();
    } else {
      print('FIREBASE | User is signed in!');
      store.auth.logIn(user);
    }
    store.setProjectReady();
  });
}

Future<void> login(String email, String password) async {
  try {
    print('===> 3');
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, // "andiwillfly@gmail.com",
        password: password // "ward121314"
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
      return 'No user found for that email.';
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
      return 'Wrong password provided for that user.';
    }
  }
}


Future<void> logOut() async {
  await FirebaseAuth.instance.signOut();
}