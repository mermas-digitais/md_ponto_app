import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  factory CustomScaffold({
    Key? key,
    required Widget body,
    FloatingActionButton? floatingActionButton,
    Color? backgroundColor,
    bool? moveUpWhenKeyboardIsOpen,
  }) {
    return CustomScaffold._(
      key: key,
      backgroundColor: backgroundColor,
      body: body,
      moveUpWhenKeyboardIsOpen: moveUpWhenKeyboardIsOpen,
      floatingActionButton: floatingActionButton,
    );
  }

  factory CustomScaffold.withAppBar({
    Key? key,
    required AppBar appBar,
    Color? backgroundColor,
    required Widget body,
    bool? moveUpWhenKeyboardIsOpen,
  }) {
    return CustomScaffold._(
      key: key,
      backgroundColor: backgroundColor,
      moveUpWhenKeyboardIsOpen: moveUpWhenKeyboardIsOpen,
      appBar: appBar,
      body:
          //return a widget with appBar and body
          SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(children: [
                body,
              ])),
    );
  }
  factory CustomScaffold.withAppBarAndFloatingActionButton({
    Key? key,
    required AppBar appBar,
    required Widget body,
    required FloatingActionButton floatingActionButton,
    bool? moveUpWhenKeyboardIsOpen,
  }) {
    return CustomScaffold._(
      key: key,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      moveUpWhenKeyboardIsOpen: moveUpWhenKeyboardIsOpen,
      body:
          //return a widget with appBar and body
          SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(children: [
                body,
              ])),
    );
  }
  //CustomScaffold.withTabBarAndFloatingActionButton
  factory CustomScaffold.withTabBarAndFloatingActionButton({
    Key? key,
    required AppBar appBar,
    required Widget body,
    required FloatingActionButton floatingActionButton,
    bool? moveUpWhenKeyboardIsOpen,
  }) {
    return CustomScaffold._(
      key: key,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      moveUpWhenKeyboardIsOpen: moveUpWhenKeyboardIsOpen,
      body:
          //return a widget with appBar and body
          SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(children: [
                body,
              ])),
    );
  }

  factory CustomScaffold.withFloatingActionButton({
    Key? key,
    required Widget body,
    required FloatingActionButton floatingActionButton,
    bool? moveUpWhenKeyboardIsOpen,
  }) {
    return CustomScaffold._(
      key: key,
      body: body,
      moveUpWhenKeyboardIsOpen: moveUpWhenKeyboardIsOpen,
      floatingActionButton: floatingActionButton,
    );
  }

  const CustomScaffold._({
    Key? key,
    required this.body,
    this.floatingActionButton,
    this.moveUpWhenKeyboardIsOpen,
    this.appBar,
    this.backgroundColor,
  });

  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final bool? moveUpWhenKeyboardIsOpen;
  final AppBar? appBar;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: moveUpWhenKeyboardIsOpen ?? false,
      appBar: appBar,
      backgroundColor: backgroundColor,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
