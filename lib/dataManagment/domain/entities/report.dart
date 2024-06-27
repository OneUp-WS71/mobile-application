
class Report {
  final int id;
  final int heartRate;
  final int breathingFrequency;
  final int temperature;
  final String longitude;
  final String latitude;
  final DateTime reportTime;

  Report({
    required this.id,
    required this.heartRate,
    required this.breathingFrequency,
    required this.temperature,
    required this.longitude,
    required this.latitude,
    required this.reportTime,
  });
}

