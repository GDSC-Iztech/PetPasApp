import 'package:flutter/material.dart';
import 'package:petpas/constants/constants.dart';
import '/view/widgets/myCircleAvatar.dart';
import 'package:custom_calender_picker/custom_calender_picker.dart';
import 'AddVaccineScreen.dart';

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

  // Remove these lines if not used
  List<DateTime> eachDateTime = [];
  DateTimeRange? rangeDateTime;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });

      // Show vaccine add dialog after selecting date
      _showVaccineAddDialog(context);
    }
  }

  Future<void> _showVaccineAddDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return VaccineAddDialog(selectedDate: selectedDate);
      },
    );
  }

  Widget roundedCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: whiteGray,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                16.0, 8.0, 16.0, 8.0),
            child: Text('Aşı Adı: '),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                16.0, 8.0, 16.0, 8.0),
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
            // Handle back button press
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Handle menu button press
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      backgroundColor: myBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                  // Handle button press
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
                roundedCard(),
                roundedCard(),
                roundedCard(),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            color: myBlue,
            alignment: Alignment.center,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: whiteGray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Aşı Ekle",
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
