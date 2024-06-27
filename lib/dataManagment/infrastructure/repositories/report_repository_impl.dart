
import '../../domain/entities/report.dart';
import '../../domain/repositories/report_repository.dart';
import '../data_sources/api_report_data_source.dart';

class ReportRepositoryImpl implements ReportRepository {
  final ApiReportDataSource dataSource;
  ReportRepositoryImpl(this.dataSource);

  @override
  Future<Report> getReportById(int id) async {
    return dataSource.fetchReportById(id);
  }
}