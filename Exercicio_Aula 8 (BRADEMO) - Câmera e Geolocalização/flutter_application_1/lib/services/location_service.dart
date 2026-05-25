import 'package:geolocator/geolocator.dart';

class LocationService {
  /// Verifica permissões e retorna a posição atual do usuário
  static Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verifica se o serviço de localização está ativo
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception(
        'Serviço de localização desativado. '
        'Ative o GPS nas configurações do dispositivo.',
      );
    }

    // Verifica permissão de localização
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(
          'Permissão de localização negada. '
          'Conceda permissão para continuar.',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
        'Permissão de localização negada permanentemente. '
        'Altere nas configurações do app.',
      );
    }

    // Retorna a posição atual com alta precisão
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  /// Stream para atualizações contínuas de localização
  static Stream<Position> getPositionStream() {
    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10, // atualiza a cada 10 metros
    );
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }
}