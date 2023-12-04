import 'package:flutter/material.dart';
import 'package:petpas/view/screens/calenderScreen.dart';
import 'package:petpas/view/screens/passportScreen.dart';
import 'package:petpas/view/screens/petAddToList.dart';
import 'package:petpas/view/screens/petListScreen.dart';
import 'package:petpas/view/screens/profileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PetAddToList(),
    );
  }
}
