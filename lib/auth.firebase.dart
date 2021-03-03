import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth auth = FirebaseAuth.instance;


Future<void> firebaseAuthStateChanges() {
  FirebaseAuth.instance
      .authStateChanges()
      .listen((User user) {

    if (user == null) {
      print('FIREBASE | User is currently signed out!');
    } else {
      print('FIREBASE | User is signed in!');
    }
  });
}

Future<void> login() async {
  try {
    print('===> 3');
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "andiwillfly@gmail.com",
        password: "ward121314"
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}


Future<void> logOut() async {
  await FirebaseAuth.instance.signOut();
}