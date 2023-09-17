import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:md_ponto_app/src/ui/components/atmos/atmos.dart';
import 'package:md_ponto_app/src/ui/components/atmos/buttons/buttons.dart';
import 'package:md_ponto_app/src/ui/components/atmos/circle_image/circle_image.dart';
import 'package:md_ponto_app/src/ui/components/organisms/scaffold/app_scaffold.dart';
import 'package:md_ponto_app/src/utils/utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  RxBool isPasswordObscure = RxBool(true);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => CustomScaffold(
        moveUpWhenKeyboardIsOpen: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const CircleImage(),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Lorem ipsum!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur.',
                      style: Theme.of(context).textTheme.bodyMedium,
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
                          CustomInput.variant(
                            label: 'Email',
                            onChanged: (value) => {},
                            keyboardType: TextInputType.name,
                            validator: (value) => Validators.fieldEmpty(value),
                          ),
                          const SizedBox(height: 20),
                          CustomInput.variant(
                            label: 'Senha',
                            onChanged: (value) => {},
                            isObscureText: isPasswordObscure.value,
                            keyboardType: TextInputType.text,
                            validator: (value) => Validators.fieldEmpty(value),
                            iconButton: IconButton(
                              icon: Icon(
                                isPasswordObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Theme.of(context).colorScheme.background,
                              ),
                              onPressed: () {
                                isPasswordObscure.toggle();
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Esqueci minha senha',
                                style: Theme.of(context).textTheme.bodySmall,
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
                    SizedBox(
                      width: 204,
                      child: CustomButton(context: context).active(
                        label: 'Entrar',
                        onPressed: () => formKey.currentState?.validate(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
