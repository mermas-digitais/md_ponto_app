import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/data/models/user/user_model.dart';
import 'package:md_ponto_app/src/ui/old_components/circle_avatar.dart';

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
                      context: context, radius: 24, image: user.photo ?? 0)
                  .normal(),
              const SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.firstName,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 14)),
                    Text(user.group ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 12)),
                    Text(
                      'ID: ${user.uid}',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 10),
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