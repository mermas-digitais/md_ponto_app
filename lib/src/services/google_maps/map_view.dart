import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:md_ponto_app/src/routes/routes.dart';
import 'package:md_ponto_app/src/ui/helpers/toast/toast_message.dart';

class MapView extends StatefulWidget {
  const MapView({
    super.key,
    required this.taskLocation,
    required this.userPosition,
  });

  final String taskLocation;
  final LatLng userPosition;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  LatLng taskLocation = const LatLng(0.0, 0.0);

  Completer<GoogleMapController> mapController = Completer();

  ///create map controller
  void onMapCreated(GoogleMapController controller) {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
    }
  }

  @override
  void dispose() {
    mapController = Completer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isValidTaskLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const Center(child: CircularProgressIndicator()));
        } else {
          return GoogleMap(
            markers: <Marker>{
              Marker(
                markerId: const MarkerId('widget.userPosition'),
                position: widget.userPosition,
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: const InfoWindow(
                  title: 'Sua localização',
                ),
              ),
              //marker com a localização da task
              Marker(
                markerId: const MarkerId('taskLocation'),
                position: taskLocation,
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: const InfoWindow(
                  title: 'Localização da atividade',
                ),
              ),
            },
            circles: <Circle>{
              Circle(
                circleId: const CircleId('taskLocation'),
                center: taskLocation,
                radius: 100,
                fillColor:
                    //if user is in the task location, fill the circle with green
                    (Geolocator.distanceBetween(
                                widget.userPosition.latitude,
                                widget.userPosition.longitude,
                                taskLocation.latitude,
                                taskLocation.longitude) <=
                            100)
                        ? Colors.green.withOpacity(0.5)
                        : Colors.red.withOpacity(0.5),
                strokeColor: (Geolocator.distanceBetween(
                            widget.userPosition.latitude,
                            widget.userPosition.longitude,
                            taskLocation.latitude,
                            taskLocation.longitude) <=
                        100)
                    ? Colors.green.withOpacity(0.5)
                    : Colors.red.withOpacity(0.5),
                strokeWidth: 1,
              ),
            },
            onMapCreated: onMapCreated,
            initialCameraPosition:
                //initial camera position show distance between user and task location
                CameraPosition(
              target: LatLng(
                  (widget.userPosition.latitude + taskLocation.latitude) / 2,
                  (widget.userPosition.longitude + taskLocation.longitude) / 2),
              zoom: 16.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            rotateGesturesEnabled: true,
            tiltGesturesEnabled: true,
          );
        }
      },
    );
  }

  // _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  Future isValidTaskLocation() async {
    //if tasklocation contains numbers ",", "." , "-" and " ", then it's a valid location
    bool taskLocationIsValid =
        widget.taskLocation.contains(RegExp(r'[0-9,.-]'));

    if (taskLocationIsValid) {
      taskLocation = LatLng(double.parse(widget.taskLocation.split(",")[0]),
          double.parse(widget.taskLocation.split(",")[1]));
    } else {
      toastMessage('Localização da atividade inválida');
      AppNavigate.pop();
    }
  }
}
