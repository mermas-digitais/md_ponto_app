import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/controllers.dart';
import '../../../../data/data.dart';
import '../../../old_components/task_models.dart';

class TasksManage extends StatefulWidget {
  const TasksManage({super.key});

  @override
  State<TasksManage> createState() => _TasksManageState();
}

class _TasksManageState extends State<TasksManage> {
  final TextEditingController textEditingController = TextEditingController();
  late final TasksController _controller;
  late final List listTasks;
  @override
  void initState() {
    _controller = TasksController(
      repository: PontoAppRepository(
        dio: Dio(),
      ),
    );
    _controller.getListTasks();
    listTasks = _controller.listTasks;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _controller.listTasksIsLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : listTasks.isEmpty
              ? Center(
                  child: Text(
                    "Nenhuma tarefa encontrada",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  //when keyboard is open, the listview dont move up
                  itemCount: listTasks.length,
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
                                "Tarefas cadastradas ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      fontSize: 14,
                                    ),
                              ),
                              Text(
                                "(${listTasks.length})",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary
                                          .withOpacity(0.8),
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),
                          TaskModels(
                                  context: context,
                                  name: listTasks[index].name,
                                  description: listTasks[index].description,
                                  displayLocation:
                                      listTasks[index].displayLocation,
                                  displayStartDate:
                                      listTasks[index].displayStartDate,
                                  userUID: "ACFsy9WA74c81V8pT4iBUF9hjDh2",
                                  taskUsers: listTasks[index].users)
                              .inactiveTasks(),
                        ],
                      );
                    } else {
                      return TaskModels(
                              context: context,
                              name: listTasks[index].name,
                              description: listTasks[index].description,
                              displayLocation: listTasks[index].displayLocation,
                              displayStartDate:
                                  listTasks[index].displayStartDate,
                              userUID: "ACFsy9WA74c81V8pT4iBUF9hjDh2",
                              taskUsers: listTasks[index].users)
                          .inactiveTasks();
                    }
                  }),
    );
  }
}
