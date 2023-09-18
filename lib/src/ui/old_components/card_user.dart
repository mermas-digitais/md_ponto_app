import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/data/models/user/user_model.dart';
import 'package:md_ponto_app/src/ui/components/atmos/circle_avatar/profile_circle_avatar.dart';

class CardUser extends StatelessWidget {
  final UserModel user;

  factory CardUser({
    Key? key,
    required UserModel user,
    required Widget content,
  }) {
    return CardUser._(
      key: key,
      user: user,
      content: content,
    );
  }

  factory CardUser.normal({
    Key? key,
    required UserModel user,
    required BuildContext context,
  }) {
    return CardUser._(
      key: key,
      user: user,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
            width: MediaQuery.of(context).size.width - 40,
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 11.42, vertical: 9.13),
              child: Row(children: [
                ProfileCircleAvatar.normal(
                  radius: 24,
                  image: user.profilePhoto.toString(),
                ),
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
      ),
    );
  }

  const CardUser._({super.key, required this.user, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return content;
  }
}
