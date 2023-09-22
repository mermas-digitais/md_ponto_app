import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:md_ponto_app/src/routes/app_navigate.dart';
import 'package:md_ponto_app/src/ui/theme/theme.dart';

class WellcomeScreen extends StatelessWidget {
  const WellcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return

        //screen with a image in all background and a button in the middle
        Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          // Imagem na parte superior da tela
          Center(
            child: SizedBox(
              height: screenHeight,
              width: screenWidth,
              child: SvgPicture.asset(
                'lib/src/ui/assets/images/background.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Container Seja bem vindo
          Positioned(
            bottom: screenHeight * 0.46,
            width: screenWidth * 0.88,
            left: screenWidth * 0.06,
            child: frostedGlass(
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Seja bem vindo!',
                    style: lightTheme().textTheme.displayLarge?.copyWith(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: lightTheme().colorScheme.surfaceVariant,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Aqui você pode acessar todas as atividades do projeto e muito mais.',
                    style: lightTheme().textTheme.displayLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: lightTheme()
                              .colorScheme
                              .surfaceVariant
                              .withOpacity(0.8),
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  //button with text and sufix icon arrow right icon. button has a background color (lightheme.primarycolor) and outlined color is lightheme.tertiary color
                  ElevatedButton.icon(
                    onPressed: () {
                      AppNavigate.to.login();
                    },
                    label: Text(
                      'Vamos começar',
                      style: lightTheme().textTheme.displayLarge?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: lightTheme().colorScheme.surfaceVariant),
                    ),
                    icon: const Icon(Iconsax.arrow_right_3),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: lightTheme().colorScheme.primary,
                      foregroundColor: lightTheme().colorScheme.surfaceVariant,
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
                  ),
                ],
              ),
            ),
          ),
          // Container bottom_md
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: screenHeight / 2 - 86,
            child: SvgPicture.asset(
              'lib/src/ui/assets/images/bottom_md.svg',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }

  frostedGlass({required Widget content}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
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
    //  Scaffold(
    //   body: Stack(
    //     children: <Widget>[
    //       // Imagem na parte superior da tela
    //       Positioned(
    //         top: screenHeight / 20 - 180,
    //         left: screenWidth / 2 - 50,
    //         child: Container(
    //           child: Container(
    //             height: 400,
    //             width: 400,
    //             child: SvgPicture.asset(
    //               'lib/src/ui/assets/images/hair_bg.svg',
    //               fit: BoxFit.fill,
    //             ),
    //           ),
    //         ),
    //       ),

    //       // Botão entre a imagem superior e o container roxo
    //       Positioned(
    //         bottom: screenHeight *
    //             0.48, // Ajuste a posição vertical conforme necessário
    //         left: 0,
    //         right: 0,
    //         child: Center(
    //           child: ElevatedButton(
    //             onPressed: () {
    //               // Adicione a navegação para a próxima tela aqui
    //             },
    //             child: Text('Botão'),
    //           ),
    //         ),
    //       ),

    //       // Container roxo na parte inferior
    //       Positioned(
    //         bottom: 0,
    //         left: 0,
    //         right: 0,
    //         height: screenHeight / 2,
    //         child: Container(
    //           color: Colors.purple,
    //           child: Center(
    //             child: Text(
    //               'Container Roxo',
    //               style: TextStyle(
    //                 fontSize: 24,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white,
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
//   }
// }
