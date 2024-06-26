
import 'package:mobile_application/dataManagment/domain/repositories/report_repository.dart';
import '../../domain/entities/report.dart';

class GetReportById {
  final ReportRepository repository;

  GetReportById(this.repository);

  Future<Report> call (int id) async {
    return repository.getReportById(id);
  }
}