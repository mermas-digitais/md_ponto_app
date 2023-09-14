import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:md_ponto_app/src/controllers/controllers.dart';
import '../../../../data/data.dart';
import '../../../old_components/card_user.dart';

class UserManage extends StatefulWidget {
  final List listUsers;

  final UsersController controller;

  const UserManage(
      {super.key, required this.listUsers, required this.controller});

  @override
  State<UserManage> createState() => _UserManageState();
}

class _UserManageState extends State<UserManage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => widget.controller.listUsersIsLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : widget.listUsers.isEmpty
              ? Center(
                  child: Text(
                    "Nenhum usuário encontrado",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),

                  //when keyboard is open, the listview dont move up
                  itemCount: widget.listUsers.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 22),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Usuários cadastrados ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                              Text("(${widget.listUsers.length})",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .tertiary
                                            .withOpacity(0.8),
                                      )),
                            ],
                          ),
                          const SizedBox(height: 22),
                          CardUser.normal(
                            user: UserModel(
                              uid: widget.listUsers[index].uid,
                              firstName: widget.listUsers[index].firstName,
                              lastName: widget.listUsers[index].lastName,
                              group: widget.listUsers[index].group,
                              photo: widget.listUsers[index].photo,
                            ),
                            context: context,
                          ),
                        ],
                      );
                    } else {
                      return CardUser.normal(
                        user: UserModel(
                          uid: widget.listUsers[index].uid,
                          firstName: widget.listUsers[index].firstName,
                          lastName: widget.listUsers[index].lastName,
                          group: widget.listUsers[index].group,
                          photo: widget.listUsers[index].photo,
                        ),
                        context: context,
                      );
                    }
                  }),
    );
  }
}
