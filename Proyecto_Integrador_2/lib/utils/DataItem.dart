class DataItem {
  final String? name;
  final DateTime? timestamp;
  final double? latitude;  // Latitud con 6 decimales
  final double? longitude; // Longitud con 6 decimales
  final String? id;

  DataItem({
    required this.name,
    required this.timestamp,
    required this.latitude,
    required this.longitude,
    required this.id,
  });
}