import 'package:dio/dio.dart';

import 'package:mobile_application/application/domain/datasources/user_datasource.dart';
import 'package:mobile_application/application/infrastructure/model/userdb/user_userdb.dart';

import '../../entities/user.dart';

class UserDbDatasource extends UserDatasource {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://oneupbackend.zeabur.app/api/oneup/v1')
  );

  @override
  Future<dynamic> getUserById(int userId) async{
    final response = await dio.get('/users/$userId');
    if (response.statusCode != 200)
      throw Exception('User with id: $userId not found');

    final userDetail = UserUserDb.fromJson(response.data);
    return userDetail;
  }
}