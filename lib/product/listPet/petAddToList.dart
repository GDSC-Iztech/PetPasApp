import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:petpas/widgets/myTextForm.dart";

import 'add_viewmodel.dart';

class PetAddToList extends StatefulWidget {
  const PetAddToList({super.key});

  @override
  State<PetAddToList> createState() => _PetAddToListState();
}

class _PetAddToListState extends PetAddListViewmodel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hayvan Ekle"),
      ),
      body: Column(
        // PetModel'e esdeger veriler burada eklenecek

        children: [
          const Center(child: CircleAvatar()),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Ad"),
          ),
          TextFormField(
            controller: ageController,
            decoration: InputDecoration(labelText: "Yas"),
          ),
          TextFormField(
            controller: kindController,
            decoration: InputDecoration(labelText: "Tur"),
          ),
          TextFormField(
            controller: vaccineController,
            decoration: InputDecoration(labelText: "Vaccine"),
          ),
          TextFormField(
            controller: imageController,
            decoration: InputDecoration(labelText: "Image"),
          ),
          TextButton(
              onPressed: addPet,
              child: const Text(
                "Ekle",
              ))
        ],
      ),
    );
  }
}
