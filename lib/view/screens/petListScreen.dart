import 'package:flutter/material.dart';

class PetListScreen extends StatefulWidget {
  const PetListScreen({super.key});

  @override
  State<PetListScreen> createState() => _PetListScreenState();
}

class _PetListScreenState extends State<PetListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hayvan Listesi"),
      ),
      body: const Column(children: [
        // liste arama kismi,
        // listview gorunumu,
      ]),
    );
  }
}
