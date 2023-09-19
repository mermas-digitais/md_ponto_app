import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:md_ponto_app/src/ui/helpers/toast/toast_message.dart';

class UserPosition {
  LatLng usePosition = const LatLng(0, 0);

  Future<LatLng> getCurrentLocation() async {
    final LocationPermission permission = await Geolocator.requestPermission();

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      toastMessage('Por favor, ative a localização do seu dispositivo');
    }

    if (permission == LocationPermission.deniedForever) {
      toastMessage(
          'Permissão de localização negada - solicite permissão de localização');
    }
    if (permission == LocationPermission.denied) {
      toastMessage(
          'Permissão de localização negada - solicite permissão de localização');
    } else {
      usePosition = await Geolocator.getCurrentPosition()
          .then((value) => LatLng(value.latitude, value.longitude));
    }

    return usePosition;
  }
}
