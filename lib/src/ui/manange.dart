import 'package:flutter/material.dart';

class ManangePage extends StatefulWidget {
  const ManangePage({super.key});

  @override
  State<ManangePage> createState() => _ManangePageState();
}

class _ManangePageState extends State<ManangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        //child is a listview with users informations
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          height: 200,
          width: 200,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.abc),
      ),
    );
  }
}
