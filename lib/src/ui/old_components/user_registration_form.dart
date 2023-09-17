import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/data/data.dart';
import 'package:md_ponto_app/src/ui/old_components/dialog.dart';
import '../../controllers/controllers.dart';
import '../../ui/components/componentes.dart';
import 'package:md_ponto_app/src/utils/validators/validators.dart';

class UserRegistrationForm extends StatefulWidget {
  const UserRegistrationForm({super.key});

  @override
  State<UserRegistrationForm> createState() => _UserRegistrationFormState();
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {
  late final UsersController _userController;
  final formKey = GlobalKey<FormState>();

  late String? firstName;
  late String? lastName;
  late String? email;

  int userGroup = 0;
  int userType = 0;

  String getUserGroup(int index) => index == 0 ? 'Bolsista' : "Voluntário";
  String getUserType(int index) => index == 0 ? 'Usuário' : "Administrador";

  @override
  void initState() {
    super.initState();
    _userController = UsersController(
      repository: PontoAppRepository(
        dio: Dio(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      buttons: true,
      title: "Cadastrar usuário",
      content: SizedBox(
        height: MediaQuery.of(context).size.height / 2.6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Informações do usuário',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.4),
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInput(
                      label: 'nome',
                      onSaved: (String? value) {
                        firstName = value;
                      },
                      keyboardType: TextInputType.name,
                      validator: (value) => Validators.fieldEmpty(value),
                    ),
                    const SizedBox(height: 20),
                    CustomInput(
                      label: 'exemplo@email.com',
                      onSaved: (String? value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => Validators.email(value),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'Grupo',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 14,
                      children: List<Widget>.generate(
                        2,
                        (int index) {
                          return ChoiceChip(
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              label: Text(
                                getUserGroup(index),
                                style: userGroup == index
                                    ? Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background)
                                    : Theme.of(context).textTheme.bodySmall,
                              ),
                              selected: userGroup == index,
                              onSelected: (bool selected) {
                                setState(
                                    () => userGroup = selected ? index : 0);
                              });
                        },
                      ).toList(),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          'Tipo de usuário',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.4)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 14,
                      children: List<Widget>.generate(
                        2,
                        (int index) {
                          return ChoiceChip(
                            selectedColor:
                                Theme.of(context).colorScheme.primary,
                            label: Text(
                              getUserType(index),
                              style: userType == index
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .background)
                                  : Theme.of(context).textTheme.bodySmall,
                            ),
                            selected: userType == index,
                            onSelected: (bool selected) {
                              setState(() => userType = selected ? index : 0);
                            },
                          );
                        },
                      ).toList(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      confirmText: "Confirmar",
      confirmFunction: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();

          _userController.createUser(
            UserModel(
              firstName: firstName as String,
              lastName: lastName as String,
              email: email,
              group: getUserGroup(userGroup),
              userType: userType == 0 ? 'user' : 'admin',
              profilePhoto: '0',
            ),
          );
        }
      },
    );
  }
}
