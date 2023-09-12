import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:md_ponto_app/src/ui/helpers/toast/toast_message.dart';

class MapView extends StatefulWidget {
  const MapView({super.key, required this.taskLocation});
  final String taskLocation;

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late GoogleMapController mapController;
  LatLng currentPosition = const LatLng(0.0, 0.0);
  LatLng taskLocation = const LatLng(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCurrentLocation(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              child: const Center(child: CircularProgressIndicator()));
        } else {
          return GoogleMap(
            markers: <Marker>{
              Marker(
                markerId: const MarkerId('currentPosition'),
                position: currentPosition,
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
                                currentPosition.latitude,
                                currentPosition.longitude,
                                taskLocation.latitude,
                                taskLocation.longitude) <=
                            100)
                        ? Colors.green.withOpacity(0.5)
                        : Colors.red.withOpacity(0.5),
                strokeColor: (Geolocator.distanceBetween(
                            currentPosition.latitude,
                            currentPosition.longitude,
                            taskLocation.latitude,
                            taskLocation.longitude) <=
                        100)
                    ? Colors.green.withOpacity(0.5)
                    : Colors.red.withOpacity(0.5),
                strokeWidth: 1,
              ),
            },
            onMapCreated: _onMapCreated,
            initialCameraPosition:
                //initial camera position show distance between user and task location
                CameraPosition(
              target: LatLng(
                  (currentPosition.latitude + taskLocation.latitude) / 2,
                  (currentPosition.longitude + taskLocation.longitude) / 2),
              zoom: 14.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            scrollGesturesEnabled: true,
            rotateGesturesEnabled: true,
            // tiltGesturesEnabled: true,
          );
        }
      },
    );
  }

  _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      toastMessage('Por favor, ative a localização do seu dispositivo');
      return Future.error('Por favor, ative a localização do seu dispositivo');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      toastMessage(
          'Permissão de localização negada - solicite permissão de localização');
      return Future.error(
          'Permissão de localização negada - solicite permissão de localização');
    }
    if (permission == LocationPermission.denied) {
      toastMessage(
          'Permissão de localização negada - solicite permissão de localização');
      return Future.error(
          'Permissão de localização negada - solicite permissão de localização');
    } else {
      currentPosition = await Geolocator.getCurrentPosition()
          .then((value) => LatLng(value.latitude, value.longitude));
      //if tasklocation contains numbers ",", "." and " ", then it's a valid location
      if (widget.taskLocation.contains(RegExp(r'[0-9,. ]'))) {
        taskLocation = LatLng(double.parse(widget.taskLocation.split(",")[0]),
            double.parse(widget.taskLocation.split(",")[1]));
      } else {
        toastMessage('Localização da atividade inválida');
        return Future.error('Localização da atividade inválida');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}
