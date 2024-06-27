import 'package:dio/dio.dart';
import 'package:mobile_application/security/application/models/user_userdb.dart';
late UserUserDb userDetail;
late UserUserDb userDetail2;

class UserDataProvider{
  final dio = Dio(
    BaseOptions(baseUrl: 'https://oneupmain.zeabur.app/api/oneup/v1')
  );


  Future<UserUserDb> getUserByName(String username) async{
    try {
      final response = await dio.get('/users/username/${username}');
      if (response.statusCode != 200) {
        throw Exception('User with id: $username not found');
      }
      userDetail = UserUserDb.fromJson(response.data);
      return userDetail;
    } catch (e) {
      throw Exception('User with id: $username not found');
    }
  }
  Future<UserUserDb> postUser(UserUserDb user) async{
    try {

      Response response = await dio.post(
        '/users',
        data: user.toJson(),
      );

      return UserUserDb.fromJson(response.data);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
  Future<Patient> postPatient(Patient patient, int id) async{
    try {

      Response response = await dio.post(
        '/patients/${id.toString()}',
        data: patient.toJson(),
      );

      return Patient.fromJson(response.data);
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}