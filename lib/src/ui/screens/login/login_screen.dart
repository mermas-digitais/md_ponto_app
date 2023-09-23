import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:md_ponto_app/src/core/auth/auth.dart';
import 'package:md_ponto_app/src/routes/app_navigate.dart';
import 'package:md_ponto_app/src/ui/helpers/helpers.dart';
import 'package:md_ponto_app/src/ui/theme/theme.dart';

import '../../../utils/utils.dart';
import '../../components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  RxBool isPasswordObscure = RxBool(true);

  Future<void> login() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    User? user = await _authService.signInWithEmailAndPassword(
        email: email, password: password);

    if (user != null) {
      // Login bem-sucedido, você pode navegar para a próxima tela ou realizar outras ações
      AppNavigate.to.home();
    } else {
      // Login falhou, exibir uma mensagem de erro para o usuário
      toastMessage(
        message: 'Erro ao fazer login. Verifique suas credenciais.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: <Widget>[
            // Imagem na parte superior da tela
            Center(
              child: SvgPicture.asset(
                'lib/src/ui/assets/images/background_md.svg',
                fit: BoxFit.cover,
                height: screenHeight,
                width: screenWidth,
              ),
            ),
            Positioned(
                child: frostedGlass(
                    content: SizedBox(
              height: screenHeight,
              width: screenWidth,
            ))),
            Center(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        'lib/src/ui/assets/images/logo_branca_md.svg',
                        fit: BoxFit.cover,
                        height: 159.46,
                        width: 205,
                      ),
                      Text(
                        'Mermãs Digitais',
                        style: lightTheme().textTheme.displayLarge?.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: lightTheme().colorScheme.background,
                              fontFamily: GoogleFonts.paytoneOne().fontFamily,
                            ),
                      ),

                      Text(
                        'Ponto app',
                        style: lightTheme().textTheme.displayLarge?.copyWith(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: lightTheme()
                                  .colorScheme
                                  .background
                                  .withOpacity(0.8),
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomInput.variant2(
                              label: 'Email',
                              onChanged: (value) => {},
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              validator: (value) =>
                                  Validators.fieldEmpty(value),
                            ),
                            const SizedBox(height: 20),
                            CustomInput.variant2(
                              label: 'Senha',
                              onChanged: (value) => {},
                              isObscureText: isPasswordObscure.value,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              validator: (value) =>
                                  Validators.fieldEmpty(value),
                              iconButton: IconButton(
                                icon: Icon(
                                  isPasswordObscure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                                onPressed: () {
                                  isPasswordObscure.toggle();
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Esqueci minha senha',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: lightTheme()
                                            .colorScheme
                                            .background
                                            .withOpacity(0.6),
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          login();
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(204, 48),
                          splashFactory: InkRipple.splashFactory,
                          backgroundColor:
                              lightTheme().colorScheme.surfaceVariant,
                          foregroundColor:
                              lightTheme().colorScheme.surfaceVariant,
                          disabledForegroundColor: lightTheme()
                              .colorScheme
                              .surfaceVariant
                              .withOpacity(0.38),
                          disabledBackgroundColor: lightTheme()
                              .colorScheme
                              .surfaceVariant
                              .withOpacity(0.12),
                          side: BorderSide(
                            color: lightTheme().colorScheme.tertiary,
                            width: 2.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Entrar',
                          style: lightTheme().textTheme.displayLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: lightTheme().colorScheme.primary),
                        ),
                      ),

                      // ElevatedButton.icon(
                      //   onPressed: () {
                      //     AppNavigate.to.home();
                      //   },
                      //   label: Text(
                      //     'Vamos começar',
                      //     style: lightTheme().textTheme.displayLarge?.copyWith(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.w500,
                      //         color: lightTheme().colorScheme.surfaceVariant),
                      //   ),
                      //   icon: const Icon(Iconsax.arrow_right_3),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: lightTheme().colorScheme.primary,
                      //     foregroundColor: lightTheme().colorScheme.surfaceVariant,
                      //     disabledForegroundColor: lightTheme()
                      //         .colorScheme
                      //         .surfaceVariant
                      //         .withOpacity(0.38),
                      //     disabledBackgroundColor: lightTheme()
                      //         .colorScheme
                      //         .surfaceVariant
                      //         .withOpacity(0.12),
                      //     side: BorderSide(
                      //       color: lightTheme().colorScheme.tertiary,
                      //       width: 2.0,
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  frostedGlass({required Widget content}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.02),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF9FA3A7).withOpacity(0.02),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: content,
            ),
          ),
        ),
      ),
    );
  }
}
