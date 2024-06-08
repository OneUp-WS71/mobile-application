import 'package:mobile_application/application/entities/user.dart';

abstract class UserDatasource {
  Future<dynamic> getUserById(int userId);
}