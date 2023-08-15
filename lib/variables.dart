import 'package:flutter/material.dart';

const kprimaryred = Color(0xffff1302);
const kbgcolour = Color(0xffFFFFFF);
const kprimarygrey = Color(0xff555151);

const kredbttnStyle = TextStyle(
  fontSize: 17.0,
  color: Color(0xffff1302),
);

const kheadingStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 19,
  color: Colors.black,
);

const knormalStyle = TextStyle(
  color: kprimarygrey,
  fontSize: 17.0,
  fontWeight: FontWeight.w500,
);

final ktimerbtnstyle = ElevatedButton.styleFrom(
  primary: kprimaryred,

  shadowColor: Color(0xffd46859),
  elevation: 15,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  minimumSize: Size(200, 50), //////// HERE
);

final klogbtnstyle = ElevatedButton.styleFrom(
  primary: kprimaryred,

  shadowColor: Color(0xffd46859),
  elevation: 15,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  minimumSize: Size(300, 56), //////// HERE
);

List<BoxShadow> kboxShadowList = [
  BoxShadow(
    color: Colors.grey,
    offset: const Offset(0.0, 0.0),
    blurRadius: 3.0,
    spreadRadius: 4.0,
  ),
  BoxShadow(
    color: kbgcolour,
    spreadRadius: -10,
    blurRadius: 10,
    offset: Offset(0, 0),
  ),
];

const kdefaultsize = TextStyle(fontSize: 17.0);
