import 'package:flutter/material.dart';
import 'package:get/get.dart';


//create a class to call Navigator.pushNamed without context
class AppNavigator {
  static Future<dynamic>? pushNamed(String routeName, {required Object arguments}) {
    return Get.toNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? pushReplacementNamed(String routeName,
      {required Object arguments}) {
    return Get.offNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? pushNamedAndRemoveUntil(String routeName,
      {required Object arguments}) {
    return Get.offAllNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? pushNamedAndRemoveAll(String routeName,
      {required Object arguments}) {
    return Get.offAllNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? push(Widget page) {
    return Get.to(page);
  }

  static Future<dynamic>? pushReplacement(Widget page) {
    return Get.off(page);
  }

  static Future<dynamic>? pushAndRemoveUntil(Widget page) {
    return Get.offAll(page);
  }

  static Future<dynamic>? pushAndRemoveAll(Widget page) {
    return Get.offAll(page);
  }

  static Future<dynamic>? pushNamedWithArgs(String routeName,
      {required Object arguments}) {
    return Get.toNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? pushReplacementNamedWithArgs(String routeName,
      {required Object arguments}) {
    return Get.offNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? pushNamedAndRemoveUntilWithArgs(String routeName,
      {required Object arguments}) {
    return Get.offAllNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? pushNamedAndRemoveAllWithArgs(String routeName,
      {required Object arguments}) {
    return Get.offAllNamed(routeName, arguments: arguments);
  }
}