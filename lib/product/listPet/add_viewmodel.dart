import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petpas/manager/petlistmanager/petmodel.dart';

import '../../manager/petlistmanager/list_manager.dart';
import 'petAddToList.dart';

abstract class PetAddListViewmodel extends State<PetAddToList> {
  ListManager listManager = ListManager();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController kindController = TextEditingController();
  TextEditingController vaccineController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  void addPet() {
    listManager.allPets.add(
      PetModel(
        name: nameController.text,
        age: ageController.text,
        kind: kindController.text,
        vaccine: vaccineController.text,
        imageUrl: imageController.text,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
