//retornar um botto sheet para registrar a frequencia do usuario na task, esse bottom sheet precisa do uid do usuario de das informações da task

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:md_ponto_app/src/utils/google_maps.dart';

class FrequenceBottomSheet extends StatefulWidget {
  final String title;
  final String displayStartDate;
  final String taskLocation;

  const FrequenceBottomSheet(
      {super.key,
      required this.title,
      required this.displayStartDate,
      required this.taskLocation});

  @override
  State<FrequenceBottomSheet> createState() => _FrequenceBottomSheetState();
}

class _FrequenceBottomSheetState extends State<FrequenceBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Text(widget.title, style: Theme.of(context).textTheme.bodyLarge),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Divider(
                color: Theme.of(context)
                    .colorScheme
                    .surfaceVariant
                    .withOpacity(0.6),
                thickness: 1,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Iconsax.clock,
                    size: 14,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4.0),
                  //show current  date and time in real time
                  Text(
                    //formate date to (D "de" MMM"," YYYY HH:MM "h")
                    DateFormat('D "de" MMM"," yyyy HH:mm "h"')
                        .format(DateTime.now()),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 14,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant
                            .withOpacity(0.6)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Sua localização atual',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withOpacity(0.6)),
              ),
              const SizedBox(height: 8),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceVariant
                        .withOpacity(0.3),
                  ),
                  color: Theme.of(context).colorScheme.surfaceVariant,
                ),
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: MapView(
                    taskLocation: widget.taskLocation,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
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
        ),
      ],
    );
  }
}
