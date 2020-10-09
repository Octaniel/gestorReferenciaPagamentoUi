import 'package:flutter/material.dart';

info(String title, double width, String info) {
  return Container(
    width: 645,
    child: Row(
      children: [
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Spacer(flex: 15),
        Container(
          width: width,
            child: Text(
          info,
          textAlign: TextAlign.right,
        )),
      ],
    ),
  );
}
