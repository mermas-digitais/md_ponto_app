import 'package:get/get.dart';
import '../../data/data.dart';

class UsersController extends GetxController {
  final PontoAppRepository repository;
  final List<UserModel> _listUsers = <UserModel>[].obs;
  final RxBool _listUsersIsLoading = false.obs;

  List<UserModel> get listUsers => _listUsers;
  RxBool get listUsersIsLoading => _listUsersIsLoading;

  UsersController({required this.repository});
//get list of all users from repository
  getListUsers() async {
    _listUsersIsLoading.value = true;

    final response = await repository.listUsers();

    if (_listUsers.isEmpty) {
      _listUsers.addAll(response);
    }

    _listUsersIsLoading.value = false;
  }

  findUserByName(String name) async {
    _listUsersIsLoading.value = true;
    final response = await repository.findUserByName(name);

    if (_listUsers.isEmpty) {
      _listUsers.addAll(response);
    }

    _listUsersIsLoading.value = false;
  }

  //createUser
  createUser(UserModel user) async {
    _listUsersIsLoading.value = true;
    await repository.createUser(user);
    _listUsersIsLoading.value = false;
  }
}
