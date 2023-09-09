import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:md_ponto_app/src/components/card_user.dart';
import 'package:md_ponto_app/src/components/dialog.dart';
import 'package:md_ponto_app/src/data/repositories/md_ponto_app_repository.dart';
import 'package:md_ponto_app/src/ui/home_page_controller.dart';

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
    double deviceHeight = MediaQuery.of(context).size.height / 2;

    return CustomDialog(
      title: 'Monitores presentes',
      content: Obx(
        () => _controller.usersTaskIsLoading.value
            ? SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : usersTask.isEmpty
                ? SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: const Center(
                      child: Text("Nenhum usuário encontrado"),
                    ),
                  )
                : SizedBox(
                    width: double.infinity,
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
                        child: CardUser(user: usersTask[index]),
                      ),
                    ),
                  ),
      ),
    );
  }
}
