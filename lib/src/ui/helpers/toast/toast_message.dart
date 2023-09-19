import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      //backgroud color of colorScheme.background without use "context"
      backgroundColor: const Color(0xFFFAFAFA),
      //backgroud color of colorScheme.primary without use "context"
      textColor: const Color(0xFF6D62D5),
      fontSize: 14.0);
}
