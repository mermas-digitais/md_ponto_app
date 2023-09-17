import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/components/atmos/buttons/buttons.dart';
import 'package:md_ponto_app/src/ui/components/atmos/circle_image/circle_image.dart';
import 'package:md_ponto_app/src/ui/components/organisms/scaffold/app_scaffold.dart';
import 'package:md_ponto_app/src/ui/screens/login/login_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleImage(),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Seja bem vindo!',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 58,
              ),
              CustomButton(context: context).withIconRight(
                label: 'Vamos começar',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ), // Substitua SegundaRota() pela rota que deseja navegar
                ),
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Theme.of(context).colorScheme.background,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
