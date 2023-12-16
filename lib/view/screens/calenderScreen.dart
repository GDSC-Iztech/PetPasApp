import 'package:flutter/material.dart';
import 'package:petpas/constants/constants.dart';
import '/view/widgets/myCircleAvatar.dart';
import 'package:custom_calender_picker/custom_calender_picker.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  final TextStyle fieldNameTextStyle =
      textStyles.fieldNameTextStyle.copyWith(fontSize: 20);

  final Color myBlue = appColor.blue;
  final Color whiteGray = appColor.whiteGray;

  List<DateTime> eachDateTime = [];
  DateTimeRange? rangeDateTime;

  Card RoundedCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: whiteGray,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                16.0, 8.0, 16.0, 8.0), // Üstten 8 ve alttan 8 padding ekledik
            child: Text('Aşı Adı: '),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                16.0, 8.0, 16.0, 8.0), // Üstten 8 ve alttan 8 padding ekledik
            child: Text('--/--/----'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myBlue,
        leading: IconButton(
          onPressed: () {
            // Sol üst köşedeki ikonun tıklama işlemi buraya eklenir
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Sağ üst köşedeki ikonun tıklama işlemi buraya eklenir
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      backgroundColor: myBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Add some space at the top
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCircleAvatar(
                border: 5,
                radius: 80,
                backgroundImage: const AssetImage("assets/cat.png"),
                backgroundColor: whiteGray,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Ad: Odin",
                style: fieldNameTextStyle,
              ),
              Text(
                "Tür: Sarman",
                style: fieldNameTextStyle,
              ),
              Text(
                "Yaş: 2",
                style: fieldNameTextStyle,
              ),
              Text(
                "Veteriner: Orhan Çakir",
                style: fieldNameTextStyle,
              ),
              ElevatedButton(
                onPressed: () {
                  // Butona tıklama işlemi buraya eklenir
                },
                style: ElevatedButton.styleFrom(
                  primary: whiteGray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Hayvan Pasaportu",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Expanded(child: Divider()),
          const SizedBox(height: 10),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
              color: myBlue,
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    "Geçmiş Aşılar",
                    style: fieldNameTextStyle,
                  ),
                  const SizedBox(height: 15),
                  RoundedCard(),
                  RoundedCard(),
                  RoundedCard(),
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            color: myBlue,
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => addVaccineScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: whiteGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Takvim",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
