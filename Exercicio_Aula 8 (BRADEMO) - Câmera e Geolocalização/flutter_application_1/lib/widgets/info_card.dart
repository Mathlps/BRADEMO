import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class InfoCard extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final String statusMessage;
  final Position? position;
  final bool trackingEnabled;

  const InfoCard({
    super.key,
    required this.isLoading,
    required this.hasError,
    required this.statusMessage,
    required this.position,
    required this.trackingEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color:
                        hasError
                            ? Colors.red.shade50
                            : const Color(0xFFE8F5E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    hasError
                        ? Icons.location_off
                        : isLoading
                        ? Icons.location_searching
                        : Icons.location_on,
                    color:
                        hasError
                            ? Colors.red
                            : const Color(0xFF2E7D32),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    hasError
                        ? 'Erro de Localização'
                        : isLoading
                        ? 'Buscando...'
                        : 'Localização Atual',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (trackingEnabled)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2E7D32),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, color: Colors.white, size: 8),
                        SizedBox(width: 4),
                        Text(
                          'AO VIVO',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),

            const Divider(height: 16),

            // Coordenadas ou mensagem de erro
            if (hasError)
              Text(
                statusMessage,
                style: TextStyle(color: Colors.red.shade700, fontSize: 12),
              )
            else if (position != null) ...[
              _CoordRow(
                label: 'Latitude',
                value: position!.latitude.toStringAsFixed(6),
              ),
              const SizedBox(height: 4),
              _CoordRow(
                label: 'Longitude',
                value: position!.longitude.toStringAsFixed(6),
              ),
              const SizedBox(height: 4),
              _CoordRow(
                label: 'Precisão',
                value: '${position!.accuracy.toStringAsFixed(0)} m',
              ),
              if (position!.altitude != 0) ...[
                const SizedBox(height: 4),
                _CoordRow(
                  label: 'Altitude',
                  value: '${position!.altitude.toStringAsFixed(0)} m',
                ),
              ],
              if (position!.speed > 0) ...[
                const SizedBox(height: 4),
                _CoordRow(
                  label: 'Velocidade',
                  value:
                      '${(position!.speed * 3.6).toStringAsFixed(1)} km/h',
                ),
              ],
            ] else
              Text(
                statusMessage,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}

class _CoordRow extends StatelessWidget {
  final String label;
  final String value;

  const _CoordRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            fontFamily: 'monospace',
          ),
        ),
      ],
    );
  }
}