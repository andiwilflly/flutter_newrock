import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:newrock/components/AppLayout.component.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:newrock/auth.firebase.dart';
// Theme
import 'package:newrock/styles/theme.styles.dart';
// Models
import 'package:newrock/models/root.model.dart';
// Pages
import 'package:newrock/components/pages/LoginPage.component.dart';



// https://flutter.dev/docs/cookbook/design/themes
// flutter build appbundle
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWROCK',
      theme: themeStyles,
      home: Obx(() => store.auth == 0 ? LoginPage() : AppLayout() ),
    );
  }
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot);
          return Text('Error...',  textDirection: TextDirection.ltr);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          firebaseAuthStateChanges();
          return MaterialApp(
            title: 'NEWROCK',
            theme: themeStyles,
            home: Obx(() => store.auth.isAuth == true ? AppLayout() : AppLayout()),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Text('Loading...',  textDirection: TextDirection.ltr);
      },
    );
  }
}