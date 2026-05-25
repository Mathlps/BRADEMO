import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../services/location_service.dart';
import '../widgets/info_card.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // Controller do Google Maps
  final Completer<GoogleMapController> _mapController = Completer();

  // Estado
  Position? _currentPosition;
  String _statusMessage = 'Obtendo localização...';
  bool _isLoading = true;
  bool _hasError = false;
  Set<Marker> _markers = {};
  StreamSubscription<Position>? _positionStream;
  bool _trackingEnabled = false;

  // Posição inicial padrão (São Paulo) enquanto carrega
  static const CameraPosition _defaultPosition = CameraPosition(
    target: LatLng(-23.5505, -46.6333),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    _loadCurrentLocation();
  }

  @override
  void dispose() {
    _positionStream?.cancel();
    super.dispose();
  }

  /// Carrega a localização atual
  Future<void> _loadCurrentLocation() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
      _statusMessage = 'Obtendo localização...';
    });

    try {
      final position = await LocationService.getCurrentPosition();
      await _updatePosition(position);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _statusMessage = e.toString().replaceFirst('Exception: ', '');
      });
    }
  }

  /// Atualiza o estado com nova posição e move a câmera do mapa
  Future<void> _updatePosition(Position position) async {
    final latLng = LatLng(position.latitude, position.longitude);

    setState(() {
      _currentPosition = position;
      _isLoading = false;
      _hasError = false;
      _statusMessage =
          'Lat: ${position.latitude.toStringAsFixed(5)}, '
          'Lng: ${position.longitude.toStringAsFixed(5)}';
      _markers = {
        Marker(
          markerId: const MarkerId('current_location'),
          position: latLng,
          infoWindow: InfoWindow(
            title: 'Minha Localização',
            snippet:
                'Precisão: ${position.accuracy.toStringAsFixed(0)}m',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
        ),
      };
    });

    // Anima a câmera para a posição atual
    if (_mapController.isCompleted) {
      final controller = await _mapController.future;
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 16),
        ),
      );
    }
  }

  /// Liga/desliga rastreamento contínuo
  void _toggleTracking() {
    if (_trackingEnabled) {
      _positionStream?.cancel();
      setState(() => _trackingEnabled = false);
      _showSnackBar('Rastreamento desativado', Icons.location_off);
    } else {
      setState(() => _trackingEnabled = true);
      _showSnackBar('Rastreamento ativado', Icons.location_on);
      _positionStream = LocationService.getPositionStream().listen(
        (position) => _updatePosition(position),
        onError: (e) {
          setState(() {
            _hasError = true;
            _statusMessage = 'Erro no rastreamento: $e';
          });
        },
      );
    }
  }

  void _showSnackBar(String message, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 8),
            Text(message),
          ],
        ),
        backgroundColor: const Color(0xFF2E7D32),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  /// Centraliza o mapa na localização atual
  Future<void> _centerOnCurrentLocation() async {
    if (_currentPosition == null) {
      _loadCurrentLocation();
      return;
    }
    final controller = await _mapController.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            _currentPosition!.latitude,
            _currentPosition!.longitude,
          ),
          zoom: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Maps Sample App',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        actions: [
          // Botão de rastreamento contínuo
          IconButton(
            icon: Icon(
              _trackingEnabled ? Icons.location_on : Icons.location_off,
            ),
            tooltip:
                _trackingEnabled
                    ? 'Desativar rastreamento'
                    : 'Ativar rastreamento',
            onPressed: _currentPosition != null ? _toggleTracking : null,
          ),
          // Botão de atualizar
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Atualizar localização',
            onPressed: _loadCurrentLocation,
          ),
        ],
      ),
      body: Stack(
        children: [
          // Google Maps
          GoogleMap(
            initialCameraPosition: _defaultPosition,
            onMapCreated: (controller) {
              _mapController.complete(controller);
              // Após criar o mapa, vai para a posição atual se já tiver
              if (_currentPosition != null) {
                _updatePosition(_currentPosition!);
              }
            },
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            mapToolbarEnabled: false,
            compassEnabled: true,
          ),

          // Card de informações na parte inferior
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: InfoCard(
              isLoading: _isLoading,
              hasError: _hasError,
              statusMessage: _statusMessage,
              position: _currentPosition,
              trackingEnabled: _trackingEnabled,
            ),
          ),

          // Indicador de carregamento sobreposto
          if (_isLoading)
            Container(
              color: Colors.black26,
              child: const Center(
                child: Card(
                  elevation: 8,
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          color: Color(0xFF2E7D32),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Obtendo sua localização...',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),

      // Botão flutuante para centralizar no usuário
      floatingActionButton: FloatingActionButton(
        onPressed: _centerOnCurrentLocation,
        backgroundColor: const Color(0xFF2E7D32),
        foregroundColor: Colors.white,
        tooltip: 'Minha localização',
        child: const Icon(Icons.my_location),
      ),
    );
  }
}