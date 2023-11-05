import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class appColor {
  static final blue = HexColor("#53A9C6");
  static final brown = HexColor("#707070");

  static final black = HexColor("#020202");

  static final whiteGray = HexColor("#E4E4E4");
  static final titleWhite = HexColor("#E4E4E4");
}

class textStyles {
  static final headerTextStyle =
      TextStyle(fontSize: 17, color: Colors.white, fontFamily: "ProductSans");
  static final fieldNameTextStyle = TextStyle(
      fontSize: 16, color: appColor.titleWhite, fontFamily: "ProductSans");
}
