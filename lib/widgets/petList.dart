import 'package:flutter/material.dart';
import '../manager/petlistmanager/petmodel.dart';
import '../product/profile/passportScreen.dart';

class PetList extends StatelessWidget {
  final List<PetModel> filteredPets;
  final bool isVertical;

  PetList({
    Key? key,
    required this.filteredPets,
    this.isVertical = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: filteredPets.isNotEmpty,
      child: isVertical
          ? _buildVerticalList(context)
          : _buildHorizontalList(context),
    );
  }

  Widget _buildVerticalList(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: filteredPets.map((pet) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PassportScreen(
                    name: pet.name!,
                    age: pet.age!,
                    kind: pet.kind!,
                    vaccine: pet.vaccine!,
                    imageUrl: pet.imageUrl!,
                  ),
                ),
              );
            },
            child: ListTile(
              title: Text(pet.name!),
              subtitle: Text(
                'Age: ${pet.age}, Kind: ${pet.kind}, Vaccine: ${pet.vaccine}',
              ),
              trailing: Image.network(
                pet.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildHorizontalList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filteredPets.map((pet) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PassportScreen(
                    name: pet.name!,
                    age: pet.age!,
                    kind: pet.kind!,
                    vaccine: pet.vaccine!,
                    imageUrl: pet.imageUrl!,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(pet.name!),
                  Text('Age: ${pet.age}'),
                  Text('Kind: ${pet.kind}'),
                  Text('Vaccine: ${pet.vaccine}'),
                  Image.network(
                    pet.imageUrl!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
