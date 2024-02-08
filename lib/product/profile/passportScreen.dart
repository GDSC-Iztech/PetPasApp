import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petpas/constants/constants.dart';

import '../../widgets/myCircleAvatar.dart';
import '../../widgets/myTextForm.dart';
import 'passport_viewmodel.dart';

class PassportScreen extends StatefulWidget {
  final String? name;
  final String? age;
  final String? kind;
  final String? vaccine;
  final String? imageUrl;

  const PassportScreen({
    this.name,
    this.age,
    this.kind,
    this.vaccine,
    this.imageUrl,
  });

  @override
  State<PassportScreen> createState() => _PassportScreenState();
}

class _PassportScreenState extends PassportViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#53A9C6"),
      appBar: AppBar(
        backgroundColor: HexColor("#53A9C6"),
        centerTitle: true,
        title: Text(
          "${widget.name} Pasaportu",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/calendar');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyCircleAvatar(
                      border: 5,
                      radius: 75,
                      backgroundImage: Image.network(widget.imageUrl!).image,
                      backgroundColor: appColor.brown,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Ad: ${widget.name}\nTür: ${widget.kind}\nKilo: ${widget.age}\nSahibi: ${widget.vaccine}\nDoğum Tarihi: ${widget.imageUrl}",
                        style: textStyles.headerTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  child: Column(
                    children: [
                      MyTextForm(
                        header: "Mikroçip Numarası",
                      ),
                      MyTextForm(
                        header: "Kuduza Karşı Aşı",
                      ),
                      MyTextForm(
                        header: "Ekinokok Tedavisi",
                      ),
                      MyTextForm(
                        header: "Diğer antiparaziter tedavisi",
                      ),
                      MyTextForm(
                        header: "Tedavi Aşısı Ekle",
                        onPressed: () {},
                        suffixIcon: Icons.add_circle_outline,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
