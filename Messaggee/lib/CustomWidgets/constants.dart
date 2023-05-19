import 'package:messaggee/CustomWidgets/colors.dart';
import 'package:flutter/material.dart';

const kBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30.0),
      topRight: Radius.circular(30.0)),
);

const kTextFieldDecoration = InputDecoration(
  fillColor: Color(0xfff5f5f5), filled: true,
  hintText: '',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w300
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xfff5f5f5), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xfff5f5f5), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
  ),
);