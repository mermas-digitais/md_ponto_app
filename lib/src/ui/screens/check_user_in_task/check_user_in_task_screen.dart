import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:md_ponto_app/src/controllers/controllers.dart';
import 'package:md_ponto_app/src/routes/routes.dart';
import 'package:md_ponto_app/src/services/geolocation/get_current_position.dart';
import 'package:md_ponto_app/src/ui/components/componentes.dart';

import '../../../data/repositories/repositories.dart';
import '../../../services/services.dart';

class CheckUserInTask extends StatefulWidget {
  final String taskTitle;
  final String taskDisplayStartDate;
  final String taskLocation;
  final String taskId;
  final String userId;
  final AnimationController? animationController;
  const CheckUserInTask({
    super.key,
    required this.taskTitle,
    required this.taskDisplayStartDate,
    required this.taskLocation,
    this.animationController,
    required this.taskId,
    required this.userId,
  });

  @override
  State<CheckUserInTask> createState() => _CheckUserInTaskState();
}

class _CheckUserInTaskState extends State<CheckUserInTask> {
  late TasksController _taskController;
  late String userCoordinates;

  late LatLng userPosition;

  Future setCurrentLocation() async {
    userPosition = await UserPosition().getCurrentLocation();
  }

  @override
  void initState() {
    _taskController = Get.put(TasksController(
        repository: PontoAppRepository(
      dio: Dio(),
    )));
    setCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Criar função "util" para formatar data e inserir da tada das taks
    DateTime data = DateTime.now();
    DateFormat formato = DateFormat("dd 'de' MMM, y - HH:mm", 'pt_BR');
    String dataFormatada = formato.format(data);

    return CustomBottomSheet(
      title: widget.taskTitle,
      buttons: true,
      confirmText: "Registrar",
      confirmFunction: () async {
        await _taskController.addUserToTask(
          taskId: widget.taskId,
          userId: widget.userId,
          userCordinates: userCoordinates,
        );

        AppNavigate.pop();
      },
      animationController: widget.animationController,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Iconsax.clock,
                size: 14,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const SizedBox(width: 4.0),
              Text(
                dataFormatada,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurfaceVariant
                        .withOpacity(0.6)),
              ),
            ],
          ),
          const SizedBox(height: 16),
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
                userPosition: userPosition,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
