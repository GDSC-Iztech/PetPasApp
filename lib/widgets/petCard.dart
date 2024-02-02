import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String petName;
  final int petAge;
  final String petType;
  final String image;

  const PetCard({
    required this.petName,
    required this.petAge,
    required this.petType,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 200,
        child: Card(
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular Image of the pet using ClipOval
              ClipOval(
                child: Center(
                  child: Image.asset(
                    image,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Information about the pet
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: $petName',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Age: $petAge',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Type: $petType',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
