import 'package:get/get.dart';
import '../../data/data.dart';

class TasksController extends GetxController {
  final PontoAppRepository repository;
  final List<TaskModel> _listTasks = <TaskModel>[].obs;
  final RxBool _listTasksIsLoading = false.obs;

  List<TaskModel> get listTasks => _listTasks;
  RxBool get listTasksIsLoading => _listTasksIsLoading;

  TasksController({required this.repository});
//get list of all tasks from repository
  getListTasks() async {
    _listTasksIsLoading.value = true;

    final response = await repository.listTasks();

    if (_listTasks.isEmpty) {
      _listTasks.addAll(response);
    }

    _listTasksIsLoading.value = false;
  }

  findTaskByName(String name) async {
    _listTasksIsLoading.value = true;
    final response = await repository.findTaskByName(name);

    if (_listTasks.isEmpty) {
      _listTasks.addAll(response);
    }

    _listTasksIsLoading.value = false;
  }

  //addUserToTask
  addUserToTask({required String taskId, userId, userCordinates}) async {
    _listTasksIsLoading.value = true;
    await repository.addUserToTask(taskId, userId, userCordinates);
    _listTasksIsLoading.value = false;
  }
}
