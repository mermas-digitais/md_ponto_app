import 'package:flutter/material.dart';
import 'package:md_ponto_app/src/ui/components/molecules/app_bar/app_bar.dart';
import 'package:md_ponto_app/src/ui/components/organisms/scaffold/app_scaffold.dart';

import '../../old_components/user_registration_form.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold.withAppBarAndFloatingActionButton(
        moveUpWhenKeyboardIsOpen: false,
        appBar: CustomAppBar.withTitleAndBackButton(
          context: context,
          title: 'Admin Page',
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

          //child is a listview with users informations
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            //show dialog user_registration_form
            showDialog(
                context: context,
                builder: (context) => const UserRegistrationForm());
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ));
  }
}
