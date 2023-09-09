import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/components/buttom.dart';
import 'package:md_ponto_app/src/components/dialog.dart';
import 'package:md_ponto_app/src/components/input.dart';

class UserRegistrationForm extends StatefulWidget {
  const UserRegistrationForm({super.key});

  @override
  State<UserRegistrationForm> createState() => _UserRegistrationFormState();
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        title: "Cadastrar usuário",
        content: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
              child: Row(
                children: [
                  Text(
                    'Informações do usuário',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            Input(
              label: 'nome exemplo',
              onSubmitted: (value) => print(value),
            ),
            Container(height: 12),
            Input(
              label: 'exemplo@email.com',
              onSubmitted: (value) => print(value),
            ),
            Container(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
              child: Row(
                children: [
                  Text(
                    'Tipo de usuário',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Wrap(
                  spacing: 14,
                  children: List<Widget>.generate(
                    2,
                    (int index) {
                      return ChoiceChip(
                        selectedColor: Theme.of(context).colorScheme.primary,
                        label: Text(
                          index == 0 ? 'Monitor' : "Admin",
                          style: _value == index
                              ? Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.background)
                              : Theme.of(context).textTheme.bodySmall,
                        ),
                        selected: _value == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? index : null;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
            Container(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  context,
                ).inactive(),
                const SizedBox(width: 20),
                CustomButton(
                  context,
                ).active(
                  'Confirmar',
                  () => {},
                ),
              ],
            )
          ],
        ));
  }
}
