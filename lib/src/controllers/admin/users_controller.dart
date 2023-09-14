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
    _listUsers.addAll(response);

    _listUsersIsLoading.value = false;
  }

  findUserByName(String name) async {
    _listUsersIsLoading.value = true;
    final response = await repository.findUserByName(name);
    _listUsers.addAll(response as List<UserModel>);

    _listUsersIsLoading.value = false;
  }

  //createUser
  createUser(UserModel user) async {
    _listUsersIsLoading.value = true;
    final response = await repository.createUser(user);
    _listUsers.add(response);

    _listUsersIsLoading.value = false;
  }
}
