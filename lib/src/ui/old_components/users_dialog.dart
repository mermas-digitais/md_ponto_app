import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:md_ponto_app/src/ui/old_components/card_user.dart';
import 'package:md_ponto_app/src/ui/old_components/dialog.dart';
import 'package:md_ponto_app/src/data/repositories/md_ponto_app_repository.dart';
import 'package:md_ponto_app/src/controllers/home/home_controller.dart';

class UsersDialog extends StatefulWidget {
  final List<dynamic> usersIds;

  const UsersDialog({super.key, required this.usersIds});

  @override
  createState() => _UsersDialogState();
}

class _UsersDialogState extends State<UsersDialog>
    with SingleTickerProviderStateMixin {
  late final HomeController _controller;

  late final List usersTask;

  @override
  void initState() {
    super.initState();

    _controller = HomeController(repository: PontoAppRepository(dio: Dio()));
    _controller.getUsersTask(uid: widget.usersIds);
    usersTask = _controller.usersTask;
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height / 3;
    double deviceWidth = MediaQuery.of(context).size.width;

    return CustomDialog(
      buttons: false,
      title: 'Monitores presentes',
      content: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Obx(
          () => _controller.usersTaskIsLoading.value
              ? SizedBox(
                  height: deviceHeight,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : usersTask.isEmpty
                  ? SizedBox(
                      height: deviceHeight / 2,
                      child: const Center(
                        child: Text("Nenhum usuário encontrado"),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: SizedBox(
                        height: deviceHeight,
                        child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 20),
                          itemCount: usersTask.length,
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
                            child: CardUser(
                              user: usersTask[index],
                            ),
                          ),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
