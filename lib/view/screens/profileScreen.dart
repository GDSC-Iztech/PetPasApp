import 'package:flutter/material.dart';
import 'package:petpas/constants/constants.dart';
import 'package:petpas/view/widgets/myCard.dart';
import 'package:petpas/view/widgets/myCircleAvatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //header
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    iconSize: 40,
                  ),
                  const Column(
                    children: [
                      MyCircleAvatar(
                          border: 5,
                          radius: 80,
                          backgroundImage: AssetImage("assets/cat.png"),
                          backgroundColor: Colors.white),
                      Text(
                        "Mert Karahan",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                    ),
                    iconSize: 40,
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              //Buttons

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Hayvanlarım")),
                  ElevatedButton(
                      onPressed: () {}, child: const Text("Gelecek Aşılar"))
                ],
              ),

              //Container
              MyCard(), MyCard(), MyCard(), MyCard(), MyCard(), MyCard()
            ],
          ),
        ),
      ),
    );
  }
}
