import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/petList.dart';
import 'list_viewmodel.dart';

class PetListScreen extends StatefulWidget {
  const PetListScreen({Key? key}) : super(key: key);

  @override
  State<PetListScreen> createState() => _PetListScreenState();
}

class _PetListScreenState extends ListViewmodel {
  @override
  Widget build(BuildContext context) {
    bool shouldScroll = filteredPets.length * kMinInteractiveDimension <
        MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hayvan Listesi"),
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
            child: PetList(
              filteredPets: filteredPets,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/petAdd');
            },
            child: const Text('Hayvan Ekle'),
          ),
        ],
      ),
    );
  }
}
