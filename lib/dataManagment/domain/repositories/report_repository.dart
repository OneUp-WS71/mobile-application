import '../entities/report.dart';

abstract class ReportRepository {
  Future<Report> getReportById(int id);
}
