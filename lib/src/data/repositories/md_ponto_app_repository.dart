import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:md_ponto_app/src/data/models/user/user_model.dart';
import 'package:md_ponto_app/src/ui/helpers/toast/toast_message.dart';

import '../models/task/task_model.dart';

class PontoAppRepository {
  final Dio dio;

  PontoAppRepository({required this.dio});

  Future<List<UserModel>> getUsers() async {
    //get api_url from .env
    final result = await dio.get('${dotenv.env['API_URL']}/listUsers');
    final List<UserModel> users = [];
    if (result.statusCode == 200) {
      result.data.map((item) => users.add(UserModel.fromMap(item))).toList();
      return users;
    } else {
      throw Exception('Failed to load users list');
    }
  }

  //findUser
  Future<List> getUser(String uid) async {
    //get api_url from .env
    final result = await dio.get('${dotenv.env['API_URL']}/findUser/$uid');
    final List<UserModel> userData = [];
    if (result.statusCode == 200) {
      result.data.map((item) => userData.add(UserModel.fromMap(item))).toList();

      return userData.toList();
    } else {
      throw Exception('Failed to load user');
    }
  }

  //find User by name
  Future<List<UserModel>> findUserByName(String name) async {
    //get api_url from .env
    final List<UserModel> userData = [];

    try {
      final result = await dio.get(
        '${dotenv.env['API_URL']}/${name.isEmpty ? 'listUsers' : 'findUserByName/$name'}',
      );

      if (result.statusCode == 200) {
        result.data
            .map((item) => userData.add(UserModel.fromMap(item)))
            .toList();
      }
    } catch (e) {
      print(e);
    }

    return userData;
  }

  //list all users
  Future<List<UserModel>> listUsers() async {
    //get api_url from .env
    final result = await dio.get('${dotenv.env['API_URL']}/listUsers');
    final List<UserModel> users = [];
    if (result.statusCode == 200) {
      result.data.map((item) => users.add(UserModel.fromMap(item))).toList();
      return users;
    } else {
      throw Exception('Failed to load users list');
    }
  }

  //create user
  Future createUser(UserModel user) async {
    //get api_url from .env
    final data = user.toMap();
    data.addAll({'password': '123456'});

    try {
      print(data);
      await dio.post('${dotenv.env['API_URL']}/createUser', data: data);

      toastMessage('Usuário criado com sucesso!');
    } catch (e) {
      print(e);
      toastMessage('Erro ao criar usuário: $e');
    }
  }

  //list all tasks
  Future<List<TaskModel>> listTasks() async {
    //get api_url from .env

    final List<TaskModel> tasks = [];

    try {
      final result = await dio.get('${dotenv.env['API_URL']}/listTasks');
      if (result.statusCode == 200) {
        result.data.map((item) => tasks.add(TaskModel.fromMap(item))).toList();
      }
    } catch (e) {
      toastMessage('Erro ao buscar atividades: $e');
    }

    return tasks;
  }

  Future<List<TaskModel>> findTaskByName(String name) async {
    //get api_url from .env
    final List<TaskModel> taskData = [];

    try {
      final result = await dio.get(
        '${dotenv.env['API_URL']}/${name.isEmpty ? 'listTasks' : 'listTasksByName/$name'}',
      );
      if (result.statusCode == 200) {
        result.data
            .map(
              (item) => taskData.add(TaskModel.fromMap(item)),
            )
            .toList();
      }
    } catch (e) {
      print(e);
    }
    return taskData;
  }

  //findUsersTask
  Future<List> getUsersTask(List<dynamic> uids) async {
    //get api_url from .env
    final List<UserModel> userData = [];

    for (final id in uids) {
      final result = await dio.get('${dotenv.env['API_URL']}/findUser/$id');

      if (result.statusCode == 200) {
        result.data.forEach((item) => {
              userData.add(
                UserModel(
                  uid: item['uid'],
                  firstName: item['firstName'],
                  lastName: item['lastName'],
                  group: item['group'],
                  profilePhoto: item['profilePhoto'],
                ),
              ),
            });
      } else {
        throw Exception('Failed to load user');
      }
    }

    return userData.toList();
  }

  //getAllUserPhotosById
  Future<List> getAllUserPhotosById(List uids) async {
    //para cada uid em uids, chamar a api e retornar a lista de fotos
    final List userPhotos = [];
    for (var uid in uids) {
      final result =
          await dio.get('${dotenv.env['API_URL']}/getUserPhoto/$uid');
      if (result.statusCode == 200) {
        for (var item in result.data) {
          if (!item['profilePhoto'].contains('https://')) {
            userPhotos.add('linkDoRepositorioComAsFotos/$item[profilePhoto]');
          }
          userPhotos.add(item['profilePhoto']);
        }
      }
    }

    return userPhotos.toList();
  }

  //getTasks
  Future<List<TaskModel>> getActiveTasks() async {
    //get api_url from .env
    final result = await dio.get('${dotenv.env['API_URL']}/listTasks');
    final List<TaskModel> tasksActive = [];
    if (result.statusCode == 200) {
      //result add to tasksActive when status = "active"
      for (var item in result.data) {
        if (item['status'] == "active") {
          tasksActive.add(TaskModel.fromMap(item));
          // tasksActive.addAll({'active': item['active']}) as List<TaskModel>;
        }
      }
      return tasksActive.toList();
    } else {
      throw Exception('Failed to load active tasks');
    }
  }

  Future<List<TaskModel>> getInactiveTasks() async {
    //get api_url from .env

    final result = await dio.get('${dotenv.env['API_URL']}/listTasks');
    final List<TaskModel> tasksInactive = [];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        if (item['status'] == "inactive") {
          tasksInactive.add(TaskModel.fromMap(item));
        }
      }
      return tasksInactive.toList();
    } else {
      throw Exception('Failed to load Inactive tasks');
    }
  }

  Future<List<TaskModel>> getScheduledTasks() async {
    //get api_url from .env
    final List<TaskModel> tasksScheduleds = [];
    try {
      final result = await dio.get('${dotenv.env['API_URL']}/listTasks');

      if (result.statusCode == 200) {
        for (var item in result.data) {
          if (item['status'] == "active") {
            tasksScheduleds.add(TaskModel.fromMap(item));
          }
        }
      }
    } catch (e) {
      throw Exception('Failed to load Scheduled tasks');
    }

    return tasksScheduleds.toList();
  }
}
