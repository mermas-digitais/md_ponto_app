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

  static _PopSecure get pop => _PopSecure(Get.context!);
}

class _PopSecure {
  final BuildContext context;

  _PopSecure(this.context);

  void call() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}

class _NavigateTo {
  Future<dynamic>? splash() async => Get.toNamed(Routes.splash);
  Future<dynamic>? wellcome() async => Get.toNamed(Routes.wellcome);


  Future<dynamic>? login() async => Get.toNamed(Routes.login);

  Future<dynamic>? home() async => Get.toNamed(Routes.home);

  Future<dynamic>? admin() async => Get.toNamed(Routes.admin);

  Future<dynamic>? usersManage() async => Get.toNamed(Routes.usersManage);

  Future<dynamic>? tasksManage() async => Get.toNamed(Routes.tasksManage);
}

class _OffAll {
  Future<dynamic> login() async => Get.offAllNamed(Routes.login);
}

class _OffAndTo {
  Future<dynamic> login() async => Get.offAndToNamed(Routes.login);
}

class _OffNamedUntil {
  Future<dynamic> login() async => Get.offNamedUntil(
      Routes.login, (route) => route.settings.name == Routes.login);
}
