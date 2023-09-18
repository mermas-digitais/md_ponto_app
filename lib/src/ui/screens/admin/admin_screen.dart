import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:iconsax/iconsax.dart';
import '../admin/users_manage/users_manage.dart';
import '../admin/tasks_manage/tasks_manage.dart';
import '../../../controllers/controllers.dart';
import '../../../data/data.dart';
import '../../components/componentes.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final TextEditingController textEditingController = TextEditingController();

  final List<Tab> tabs = [
    const Tab(text: 'Usuários'),
    const Tab(text: 'Tarefas'),
    const Tab(text: 'Relatórios'),
  ];

  final UsersController _userController = Get.put(
    UsersController(
      repository: PontoAppRepository(
        dio: Dio(),
      ),
    ),
  );

  final TasksController _taskController = Get.put(TasksController(
      repository: PontoAppRepository(
    dio: Dio(),
  )));

  late List listUsers;
  late List listTasks;

  final debouncer = Debouncer(delay: const Duration(milliseconds: 400));

  @override
  void initState() {
    super.initState();
    listUsers = _userController.listUsers;
    _userController.getListUsers();
    listTasks = _taskController.listTasks;
    _taskController.getListTasks();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      _tabController.index = _tabController.index;
    });
  }

  findUserByName(String name) {
    _userController.findUserByName(name);
    listUsers.clear();
    listUsers.addAllIf(
      listUsers.where((element) => element['uid'] != element['uid']),
      _userController.listUsers,
    );
  }

  findTaskByName(String name) {
    _taskController.findTaskByName(name);
    listTasks.clear();
    listTasks.addAllIf(
      listTasks.where((element) => element['uid'] != element['uid']),
      _taskController.listTasks,
    );
  }

  void onSearch(String value) {
    _tabController.index == 0 ? findUserByName(value) : findTaskByName(value);
  }

  void onRefresh() {
    listTasks.clear();
    listUsers.clear();
    _taskController.getListTasks();

    listTasks = _taskController.listTasks;

    _userController.getListUsers();
    listUsers = _userController.listUsers;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        //dont resize when keyboard is open
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar.withTitleAndBackButtonAndTabBar(
          heroTag: 'appbar',
          context: context,
          title: "Administração",
          tabs: tabs,
          tabController: _tabController,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child:
              //gerate a  5 users cards for test
              Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                //search bar
                CustomSearchBar(
                  onChanged: (value) => debouncer(() => onSearch(value)),
                  hintText: 'Insira um nome para buscar',
                  onClear: onRefresh,
                  textEditingController: textEditingController,
                ),

                const SizedBox(height: 20),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        UserManage(
                          listUsers: listUsers,
                          controller: _userController,
                        ),
                        TasksManage(
                          listTasks: listTasks,
                          controller: _taskController,
                        ),
                        const Center(child: Text('Relatórios')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton:
            _floatingActionButton(_tabController.index, context),
      );
}

//function to gerate floating action button based on the tab index
Widget _floatingActionButton(int index, BuildContext context) {
  switch (index) {
    case 0:
      return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => const NewUserScreen(),
          );
        },
        child: const Icon(Iconsax.user_add),
      );
    case 1:
      return FloatingActionButton(
        onPressed: () {},
        child: const Icon(Iconsax.clipboard_export),
      );
    default:
      return const SizedBox();
  }
}
