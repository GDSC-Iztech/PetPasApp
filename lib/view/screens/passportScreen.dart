import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:petpas/constants/constants.dart';
import 'package:petpas/view/widgets/myCircleAvatar.dart';
import 'package:petpas/view/widgets/myTextForm.dart';

class PassportScreen extends StatefulWidget {
  const PassportScreen({super.key});

  @override
  State<PassportScreen> createState() => _PassportScreenState();
}

class _PassportScreenState extends State<PassportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#53A9C6"),
      appBar: AppBar(
        backgroundColor: HexColor("#53A9C6"),
        centerTitle: true,
        title: const Text(
          "Odin'in Pasaportu",
          style: TextStyle(color: Colors.white),
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
                        backgroundImage: AssetImage("assets/cat.png"),
                        backgroundColor: appColor.brown),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Text(
                        "Ad:Odin\nTür:Saman\nKilo:4.2\nSahibi:Ekin Karahan\nDoğum Tarihi:03/06/2019",
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
                    const MyTextForm(
                      header: "Mikroçip Numarası",
                    ),
                    const MyTextForm(
                      header: "Kuduza Karşı Aşı",
                    ),
                    const MyTextForm(
                      header: "Ekinokok Tedavisi",
                    ),
                    const MyTextForm(
                      header: "Diğer antiparaziter tedavisi",
                    ),
                    MyTextForm(
                      header: "Tedavi Aşısı Ekle",
                      onPressed: () {},
                      suffixIcon: Icons.add_circle_outline,
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
