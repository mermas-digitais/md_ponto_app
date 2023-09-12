// return bottom sheet

import 'package:flutter/material.dart';

class CustomBottomSheet {
  final Widget content;
  final BuildContext context;

  CustomBottomSheet({
    required this.content,
    required this.context,
  });

  bottomSheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      builder: (context) =>
          SizedBox(width: MediaQuery.of(context).size.width, child: content),
    );
  }
}

//create a bottom sheet for add new task
class AddNewTaskBottomSheet extends StatelessWidget {
  final Function addTask;

  const AddNewTaskBottomSheet({
    super.key,
    required this.addTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, right: 12, left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.max,
        children: [
          Text("Nova atividade", style: Theme.of(context).textTheme.bodyLarge),
          Divider(
            color:
                Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.6),
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //textfield "Títle"
                customTextField(context, "Título"),
                const SizedBox(height: 12),
                customTextField(context, "Descrição"),
                const SizedBox(height: 12),
                customTextField(context, "Nome do local"),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      "Início:",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.6)),
                    ),
                    const SizedBox(width: 10),
                    customButtom(context, "Agora",
                        Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 12),
                    customButtom(context, "Agendar",
                        Theme.of(context).colorScheme.tertiary),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      "Grupo:",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.6)),
                    ),
                    const SizedBox(width: 10),
                    customButtom(context, "Todos",
                        Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 12),
                    customButtom(context, "Bolsistas",
                        Theme.of(context).colorScheme.tertiary),
                    const SizedBox(width: 12),
                    customButtom(context, "Voluntários",
                        Theme.of(context).colorScheme.tertiary),
                  ],
                ),
                const SizedBox(height: 12),
                ListView(),

                Row(
                  children: [
                    Text(
                      "Localização:",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.6)),
                    ),
                    const SizedBox(width: 10),
                    customButtom(context, "Localização atual",
                        Theme.of(context).colorScheme.primary),
                    const SizedBox(width: 12),
                    customButtom(context, "Selecione um local",
                        Theme.of(context).colorScheme.tertiary),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "Sua .ocalização atual",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.6)),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: Theme.of(context).textButtonTheme.style?.copyWith(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context)
                            .colorScheme
                            .surfaceVariant
                            .withOpacity(0.4)),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.surfaceVariant)),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurfaceVariant
                              .withOpacity(0.3),
                        )),
              ),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () {},
                child: Text('Registrar',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ],
          )
        ],
      ),
    );
  }
}

customTextField(context, hintText) {
  return SizedBox(
    height: 48,
    child: TextField(
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: Theme.of(context).textTheme.displaySmall,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    ),
  );
}

customButtom(context, text, color) {
  return SizedBox(
    height: 32,
    child: TextButton(
      style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          side: MaterialStatePropertyAll(BorderSide(color: color)),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent)),
      onPressed: () {},
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: color, fontSize: 12),
      ),
    ),
  );
}
