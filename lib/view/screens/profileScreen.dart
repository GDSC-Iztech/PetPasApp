import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                SizedBox(
                  height: 47,
                  child: ElevatedButton(
                      onPressed: () {
                        context.go('/petList');
                      },
                      child: Text(
                        "Hayvanlarım",
                        style: TextStyle(fontSize: 20, color: appColor.blue),
                      )),
                ),
                SizedBox(
                  height: 47,
                  child: ElevatedButton(
                      onPressed: () {
                        context.go('/calender');
                      },
                      child: Text(
                        "Gelecek Aşılar",
                        style: TextStyle(fontSize: 20, color: appColor.blue),
                      )),
                ),
              ],
            ),

            //Container
            // MyCard(), MyCard(), MyCard(), MyCard(), MyCard(), MyCard()
            Expanded(
              child: Container(
                // ignore: prefer_const_constructors
                padding: EdgeInsets.only(top: 6),
                margin: EdgeInsets.only(top: 53),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(53.0),
                    topRight: Radius.circular(53.0),
                  ),
                ),
                child: ListView(
                  children: const [MyCard(), MyCard(), MyCard(), MyCard()],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
