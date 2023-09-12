import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/old_components/dialog.dart';
import 'package:md_ponto_app/src/ui/old_components/input.dart';
import 'package:md_ponto_app/src/utils/validators/validators.dart';

class UserRegistrationForm extends StatefulWidget {
  const UserRegistrationForm({super.key});

  @override
  State<UserRegistrationForm> createState() => _UserRegistrationFormState();
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {
  int value = 0;

  final formKey = GlobalKey<FormState>();

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
                Input(
                  label: 'nome exemplo',
                  onChanged: (value) => print(value),
                  keyboardType: TextInputType.name,
                  validator: (value) => Validators.fieldEmpty(value),
                ),
                const SizedBox(height: 20),
                Input(
                  label: 'exemplo@email.com',
                  onChanged: (value) => print(value),
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
      confirmFunction: () => {formKey.currentState?.validate()},
    );
  }
}
