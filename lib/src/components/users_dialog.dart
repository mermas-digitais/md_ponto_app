import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/components/card_user.dart';
import 'package:md_ponto_app/src/data/repositories/models/user_model.dart';

class UsersDialog extends StatefulWidget {
  final List<UserModel> users;

  const UsersDialog({super.key, required this.users});

  @override
  createState() => _UsersDialogState();
}

class _UsersDialogState extends State<UsersDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height / 2;

    return Center(
      child: SlideTransition(
        position: _offsetAnimation,
        child: AlertDialog(
          surfaceTintColor: Theme.of(context).colorScheme.background,
          insetPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: SizedBox(
            width: deviceWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    'Monitores presentes',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Divider(
                  color: Theme.of(context)
                      .colorScheme
                      .surfaceVariant
                      .withOpacity(0.6),
                  thickness: 1,
                ),
                SizedBox(
                  width: double.infinity,
                  height: deviceHeight,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemCount: widget.users.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 6,
                            offset: Offset(0, 1),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: CardUser(user: widget.users[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
