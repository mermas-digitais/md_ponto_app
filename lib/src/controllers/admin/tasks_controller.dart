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
    _listTasks.addAll(response);

    _listTasksIsLoading.value = false;
  }
}
