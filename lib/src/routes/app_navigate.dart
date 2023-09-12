// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes.dart';


//create a class to call Navigator.pushNamed without context
class AppNavigate {
  /// Navigation.pushNamed() shortcut.
  static _NavigateTo get to => _NavigateTo();

  /// Navigation.popAndPushNamed() shortcut.
  static _OffAll get offAll => _OffAll();

  /// Navigation.popAndPushNamed() shortcut.
  static _OffAndTo get offAndTo => _OffAndTo();

  /// Navigation.pushNamedAndRemoveUntil() shortcut.
  static _OffNamedUntil get offNamedUntil => _OffNamedUntil();

  static _PopSecure pop(BuildContext context) => _PopSecure(context);}

  
class _PopSecure {
  const _PopSecure(this.context);

  final BuildContext context;

  void secure() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}

class _NavigateTo {
  Future<dynamic>? splash() async => Get.toNamed(Routes.splash);

  Future<dynamic>? login() async => Get.toNamed(Routes.login);

  Future<dynamic>? home() async => Get.toNamed(Routes.home);

  Future<dynamic>? admin() async => Get.toNamed(Routes.admin);

}

class _OffAll {
  Future<dynamic> login() async => Get.offAllNamed(Routes.login);
}

class _OffAndTo {
  Future<dynamic> login() async =>
      Get.offAndToNamed(Routes.login);
}

class _OffNamedUntil {
  Future<dynamic> login() async =>
      Get.offNamedUntil(Routes.login, (route) => route.settings.name == Routes.login);
}


