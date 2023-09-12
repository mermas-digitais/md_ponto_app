import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  factory CustomScaffold({
    Key? key,
    required Widget body,
    FloatingActionButton? floatingActionButton,
    bool? moveUpWhenKeyboardIsOpen,
  }) {
    return CustomScaffold._(
      key: key,
      body: body,
      moveUpWhenKeyboardIsOpen: moveUpWhenKeyboardIsOpen,
      floatingActionButton: floatingActionButton,
    );
  }

  factory CustomScaffold.withAppBar({
    Key? key,
    required Widget appBar,
    required Widget body,
    bool? moveUpWhenKeyboardIsOpen,
  }) {
    return CustomScaffold._(
      key: key,
      moveUpWhenKeyboardIsOpen: moveUpWhenKeyboardIsOpen,
      body:
          //return a widget with appBar and body
          SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(children: [
                appBar,
                body,
              ])),
    );
  }
  factory CustomScaffold.withAppBarAndFloatingActionButton({
    Key? key,
    required Widget appBar,
    required Widget body,
    required FloatingActionButton floatingActionButton,
    bool? moveUpWhenKeyboardIsOpen,
  }) {
    return CustomScaffold._(
      key: key,
      floatingActionButton: floatingActionButton,
      moveUpWhenKeyboardIsOpen: moveUpWhenKeyboardIsOpen,
      body:
          //return a widget with appBar and body
          SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(children: [
                appBar,
                body,
              ])),
    );
  }

  const CustomScaffold._({
    Key? key,
    required this.body,
    this.floatingActionButton,
    this.moveUpWhenKeyboardIsOpen,
  });

  final Widget body;
  final FloatingActionButton? floatingActionButton;
  final bool? moveUpWhenKeyboardIsOpen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: moveUpWhenKeyboardIsOpen ?? false,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
