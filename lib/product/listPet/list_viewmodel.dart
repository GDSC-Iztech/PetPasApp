import 'package:flutter/material.dart';

import '../../manager/petlistmanager/list_manager.dart';
import '../../manager/petlistmanager/petmodel.dart';
import 'petListScreen.dart';

abstract class ListViewmodel extends State<PetListScreen> {
  ListManager listManager = ListManager();
  List<PetModel> filteredPets = [];

  TextEditingController searchController = TextEditingController();

  void filterPets(String query) {
    List<PetModel> filteredList = [];
    for (PetModel pet in listManager.allPets) {
      if (pet.name!.toLowerCase().contains(query.toLowerCase())) {
        filteredList.add(pet);
      }
    }
    setState(() {
      filteredPets = filteredList;
    });
  }

  @override
  void initState() {
    super.initState();
    filteredPets = listManager.allPets;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
