import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/screens/screens.dart';

bool isUserLoggedIn() {
  final user = FirebaseAuth.instance.currentUser;
  return user != null;
}

Widget checkLogin() {
  if (isUserLoggedIn()) {
    // O usuário está logado, redirecione para a tela principal
    return const HomePage();
  } else {
    // O usuário não está logado, redirecione para a tela de login
    return const LoginScreen();
  }
}
