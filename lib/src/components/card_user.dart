import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/data/repositories/models/user_model.dart';
import 'package:md_ponto_app/src/models/circle_avatar.dart';

class CardUser extends StatelessWidget {
  final UserModel user;

  const CardUser({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          width: MediaQuery.of(context).size.width - 40,
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 11.42, vertical: 9.13),
            child: Row(children: [
              ProfileCircleAvatar(
                      context: context, radius: 30, image: user.photo ?? 0)
                  .normal(),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.firstName,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(user.group ?? '',
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text(
                      'ID: ${user.uid}',
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              )
            ]),
          )),
    );
  }
}
