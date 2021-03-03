import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:newrock/components/AppLayout.component.dart";
// Theme
import 'package:newrock/styles/theme.styles.dart';
// Models
import 'package:newrock/models/root.model.dart';
// Pages
import 'package:newrock/components/pages/LoginPage.component.dart';



// https://flutter.dev/docs/cookbook/design/themes
// flutter build appbundle
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NEWROCK',
      theme: themeStyles,
      home: Obx(() => rootModel.user == 0 ? LoginPage() : AppLayout() ),
    );
  }
}