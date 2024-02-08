import 'package:flutter/material.dart';
import 'package:petpas/constants/constants.dart';

class MyTextForm extends StatefulWidget {
  final String header;
  final IconData? suffixIcon;
  final void Function()? onPressed; // Added onPressed parameter

  MyTextForm({
    super.key,
    required this.header,
    this.suffixIcon,
    this.onPressed,
  });

  @override
  State<MyTextForm> createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            widget.header,
            style: textStyles.fieldNameTextStyle,
          )),
      Padding(
        padding: const EdgeInsets.only(bottom: 19),
        child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: widget.onPressed, // Use the passed onPressed function
              icon: Icon(widget.suffixIcon),
            ),
            filled: true, // Arka planı doldur
            fillColor: Colors.white, // Arka plan rengi
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(23.0), // Köşeleri yuvarlat
            ),
          ),
        ),
      ),
    ]);
  }
}
