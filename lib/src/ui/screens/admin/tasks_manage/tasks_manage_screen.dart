import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/controllers.dart';
import '../../../old_components/task_models.dart';

class TasksManage extends StatefulWidget {
  final List listTasks;

  final TasksController controller;

  const TasksManage({
    super.key,
    required this.listTasks,
    required this.controller,
  });

  @override
  State<TasksManage> createState() => _TasksManageState();
}

class _TasksManageState extends State<TasksManage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => widget.controller.listTasksIsLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : widget.listTasks.isEmpty
              ? Center(
                  child: Text(
                    "Nenhuma tarefa encontrada",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  //when keyboard is open, the listview dont move up
                  itemCount: widget.listTasks.length,
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
                                "(${widget.listTasks.length})",
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
                                  name: widget.listTasks[index].name,
                                  description:
                                      widget.listTasks[index].description,
                                  displayLocation:
                                      widget.listTasks[index].displayLocation,
                                  displayStartDate:
                                      widget.listTasks[index].displayStartDate,
                                  userUID: "ACFsy9WA74c81V8pT4iBUF9hjDh2",
                                  taskUsers: widget.listTasks[index].users)
                              .inactiveTasks(),
                        ],
                      );
                    } else {
                      return TaskModels(
                              context: context,
                              name: widget.listTasks[index].name,
                              description: widget.listTasks[index].description,
                              displayLocation:
                                  widget.listTasks[index].displayLocation,
                              displayStartDate:
                                  widget.listTasks[index].displayStartDate,
                              userUID: "ACFsy9WA74c81V8pT4iBUF9hjDh2",
                              taskUsers: widget.listTasks[index].users)
                          .inactiveTasks();
                    }
                  }),
    );
  }
}
