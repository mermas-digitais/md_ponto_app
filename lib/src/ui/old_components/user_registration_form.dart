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
  int value = 0;
  late final UsersController _userController;

  final formKey = GlobalKey<FormState>();

  late String? firstName;
  late String? email;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      buttons: true,
      title: "Cadastrar usuário",
      content: Column(
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
                        .withOpacity(0.4)),
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
                  label: 'nome exemplo',
                  onChanged: (value) => {},
                  onSaved: (String? value) {
                    firstName = value;
                  },
                  keyboardType: TextInputType.name,
                  validator: (value) => Validators.fieldEmpty(value),
                ),
                const SizedBox(height: 20),
                CustomInput(
                  label: 'exemplo@email.com',
                  onChanged: (value) => {},
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
                      'Tipo de usuário',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
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
                          selectedColor: Theme.of(context).colorScheme.primary,
                          label: Text(
                            index == 0 ? 'Monitor' : "Admin",
                            style: value == index
                                ? Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background)
                                : Theme.of(context).textTheme.bodySmall,
                          ),
                          selected: value == index,
                          onSelected: (bool selected) {
                            setState(() => value = selected ? index : 0);
                          });
                    },
                  ).toList(),
                )
              ],
            ),
          )
        ],
      ),
      confirmText: "Confirmar",
      confirmFunction: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();

          print('$firstName - $email - $value');

          _userController.createUser(
            UserModel(
              firstName: firstName as String,
              email: email,
              group: value == 0 ? 'Monitor' : 'Admin',
              lastName: '',
              uid: '',
            ),
          );
        }
      },
    );
  }
}
