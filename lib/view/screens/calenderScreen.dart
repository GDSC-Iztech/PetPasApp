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
        children: [
          const SizedBox(height: 20), // Add some space at the top
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: MyCircleAvatar(
                  border: 5,
                  radius: 80,
                  backgroundImage: AssetImage("assets/cat.png"),
                  backgroundColor: Colors.white,
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
            ],
          ),
          const Expanded(
            child: Center(
              child: CalenderWidget(),
            ),
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
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.95,
          child: customCalender(),
        );
      },
    );
  }

  CustomCalenderPicker customCalender() {
    return const CustomCalenderPicker(
      buttonColor: Colors.black,
      selectedColor: Colors.black,
      selectedFontColor: Colors.black,
      buttonText: "Devam et",
    );
  }
}
