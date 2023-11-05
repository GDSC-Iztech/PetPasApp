import 'package:flutter/material.dart';
import 'package:petpas/constants/constants.dart';
import 'package:petpas/view/widgets/myCircleAvatar.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      padding: EdgeInsets.only(left: 13, top: 13),
      child: Row(
        children: [
          MyCircleAvatar(
              border: 5,
              radius: 60,
              backgroundImage: AssetImage("assets/cat.png"),
              backgroundColor: appColor.brown),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(53),
                color: appColor.blue,
              ),
              child: Center(
                  child: Text(
                "Odinin X Aşısı\n--/--/----",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
