import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petpas/manager/petlistmanager/petmodel.dart';

import '../../manager/petlistmanager/list_manager.dart';
import 'add_viewmodel.dart';
import 'petAddToList.dart';

class PetAddToList extends StatefulWidget {
  const PetAddToList({Key? key}) : super(key: key);

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
            onPressed: () {
              // Add the new pet
              addPet;

              // Navigate back to the previous screen
              context.push('/petList');
            },
            child: const Text("Ekle"),
          ),
        ],
      ),
    );
  }
}
