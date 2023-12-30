import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:petpas/view/widgets/listAddImage.dart";
import "package:petpas/view/widgets/listAddTextField.dart";

class PetAddToList extends StatefulWidget {
  const PetAddToList({super.key});

  @override
  State<PetAddToList> createState() => _PetAddToListState();
}

class _PetAddToListState extends State<PetAddToList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hayvan Ekle"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/petList');
          },
        ),
      ),
      body: Column(
        children: [
          const ListAddImage(),
          ListAddTextField(name: "Test"),
          ListAddTextField(name: "Test"),
          ListAddTextField(name: "Test"),
          ListAddTextField(name: "Test"),
          Expanded(
              child:
                  Container()), // Added empty container to take remaining space
          ElevatedButton(
              onPressed: () {
                context.go('/petList');
              },
              child: const Text("Ekle")),
        ],
      ),
    );
  }
}
