import 'package:flutter/material.dart';

import '../manager/petlistmanager/petmodel.dart';
import '../product/profile/passportScreen.dart';

class PetList extends StatefulWidget {
  List<PetModel> filteredPets;
  final bool isVertical;

  PetList({
    Key? key,
    required this.filteredPets,
    this.isVertical = true,
  }) : super(key: key);

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.filteredPets.isNotEmpty,
      child: widget.isVertical
          ? _buildVerticalList(context)
          : _buildHorizontalList(context),
    );
  }

  Widget _buildVerticalList(BuildContext context) {
    return ListView.builder(
      itemCount: widget.filteredPets.length,
      itemBuilder: (context, index) {
        final pet = widget.filteredPets[index];
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
          child: Card(
            elevation: 4.0,
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(pet.imageUrl!),
                  radius: 25,
                ),
                title: Text(
                  pet.name!,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Age: ${pet.age}, Kind: ${pet.kind}, Vaccine: ${pet.vaccine}',
                  style: TextStyle(fontSize: 14.0),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: widget.filteredPets.map((pet) {
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
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    child: Image.network(
                      pet.imageUrl!,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pet.name!,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        Text('Age: ${pet.age}',
                            style: TextStyle(fontSize: 14.0)),
                        Text('Kind: ${pet.kind}',
                            style: TextStyle(fontSize: 14.0)),
                        Text('Vaccine: ${pet.vaccine}',
                            style: TextStyle(fontSize: 14.0)),
                      ],
                    ),
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
