import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petpas/constants/constants.dart';

class PetCardInList extends StatefulWidget {
  final String name;

  const PetCardInList({Key? key, required this.name}) : super(key: key);

  @override
  State<PetCardInList> createState() => _PetCardInListState();
}

class _PetCardInListState extends State<PetCardInList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: appColor.blue,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: const CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(
            'https://placekitten.com/100/100', // Replace with your pet image URL
          ),
        ),
        title: Text(widget.name, style: textStyles.headerTextStyle),
        trailing: IconButton(
          icon: const Icon(
            Icons.pets,
            color: Colors.white,
          ),
          onPressed: () {
            context.go('/passport');
          },
        ),
      ),
    );
  }
}
