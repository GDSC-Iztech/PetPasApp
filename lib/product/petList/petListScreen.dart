import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petpas/widgets/petCardInList.dart';

class PetListScreen extends StatefulWidget {
  const PetListScreen({Key? key}) : super(key: key);

  @override
  State<PetListScreen> createState() => _PetListScreenState();
}

class _PetListScreenState extends State<PetListScreen> {
  List<Widget> allPets = [
    const PetCardInList(name: 'Cat'),
    const PetCardInList(name: 'Dog'),
    const PetCardInList(name: 'Fish'),
    const PetCardInList(name: 'Cat'),
  ];

  List<Widget> filteredPets = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the filteredPets list with all pets
    filteredPets = allPets;
  }

  void filterPets(String query) {
    List<Widget> filteredList = [];
    for (Widget pet in allPets) {
      if ((pet as PetCardInList)
          .name
          .toLowerCase()
          .contains(query.toLowerCase())) {
        filteredList.add(pet);
      }
    }
    setState(() {
      filteredPets = filteredList;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool shouldScroll = filteredPets.length * kMinInteractiveDimension <
        MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hayvan Listesi"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/profile');
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (query) {
                filterPets(query);
              },
              decoration: const InputDecoration(
                labelText: 'Ara',
                hintText: 'Adini giriniz',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: listViewPetList(shouldScroll),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/petAdd');
            },
            child: const Text('Hayvan Ekle'),
          ),
        ],
      ),
    );
  }

// hayvan listesini ve arama ozelligine sahip widget.
  ListView listViewPetList(bool shouldScroll) {
    return ListView.builder(
      // eger item sayisi ekranin boyunu asmiyorsa scrollabe ozelligi kapatiliyor.
      physics: shouldScroll ? const NeverScrollableScrollPhysics() : null,
      itemCount: filteredPets.length,
      itemBuilder: (context, index) {
        return filteredPets[index];
      },
    );
  }
}
