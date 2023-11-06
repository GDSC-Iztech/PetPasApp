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
            ],
          ),
          const SizedBox(height: 15),
          const Expanded(child: Divider()),
          const SizedBox(height: 15),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.40,
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

          Expanded(child: Container()),
          ElevatedButton(
            onPressed: () async {
              var result = await showModalBottomSheet(
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                    bottom: Radius.zero,
                  ),
                ),
                context: context,
                builder: (context) => const CalenderWidget(),
              );
              if (result != null) {
                if (result is DateTimeRange) {
                  setState(() {
                    rangeDateTime = result;
                  });
                }
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: whiteGray,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                  bottom: Radius.zero,
                ),
              ),
            ),
            child: const Text('Takvim', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({Key? key}) : super(key: key);

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  get whiteGray => appColor.whiteGray;
  get black => appColor.black;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: customCalender(),
    );
  }

  CustomCalenderPicker customCalender() {
    return CustomCalenderPicker(
      buttonColor: black,
      selectedColor: black.withOpacity(0.3),
      selectedFontColor: whiteGray,
      buttonText: "Devam et",
    );
  }
}
