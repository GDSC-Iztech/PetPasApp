import "package:flutter/material.dart";
import "package:petpas/view/widgets/listAddImage.dart";
import "package:petpas/view/widgets/listAddTextField.dart";

class PetAddToList extends StatefulWidget {
  const PetAddToList({super.key});

  @override
  State<PetAddToList> createState() => _PetAddToListState();
}

class _PetAddToListState extends State<PetAddToList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hayvan Ekle")),
      body: Column(children: [
        const ListAddImage(),
        ListAddTextField(name: "Test"),
        ListAddTextField(name: "Test"),
        ListAddTextField(name: "Test"),
        ListAddTextField(name: "Test"),
        ListAddTextField(name: "Test"),

        // image ekleme ozelligi olan yuvarlak bir card.
        // default 6 tane textfield iceren bir ekran olacak.
        // eklendikten sonra sayfadaki datalar silinecek ve tekrar ekleme ozelligine donecek.
      ]),
    );
  }
}
