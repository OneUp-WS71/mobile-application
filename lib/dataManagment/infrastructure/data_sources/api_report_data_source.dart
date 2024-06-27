import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobile_application/common/api_config/ApiConfig.dart';
import '../../domain/entities/report.dart';

class ApiReportDataSource{
  final String baseUrl;

  ApiReportDataSource(this.baseUrl);

  Future<Report> fetchReportById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      return Report(
          id: data['id'],
          heartRate: data['heartRate'],
          breathingFrequency: data['breathingFrequency'],
          temperature: data['temperature'],
          longitude: data['longitude'],
          latitude: data['latitude'],
          reportTime: DateTime.parse(data['reportTime']),
      );
    } else {
      throw Exception('Failed to load report');
    }
  }
}