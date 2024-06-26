import 'package:flutter/material.dart';
import 'package:mobile_application/security/application/datasources/user_datasources.dart';
import 'package:mobile_application/security/application/models/user_userdb.dart';
class UserModel with ChangeNotifier {
  UserUserDb? _username;
  UserUserDb? _username2;
  bool _error = false;

  UserUserDb? get username => _username;
  UserUserDb? get username2 => _username2;
  bool get error => _error;

  Future<void> fetchUserDetail(String username) async {
    try{
        _username = await UserDataProvider().getUserByName(username);
      print('---username21312312--- ${_username}');
      _error = false;
    }
    catch(e){
      _error = true;
    }

    }

  Future<void> postRegister( BuildContext context, UserUserDb user)async{
    try{
      
      _username2 = await UserDataProvider().postUser(user);
      print('---userDetail--- ${_username}');
      _error = false;

      print('---holadasdas--- ${_username}');
      
      
    }catch(e) {
      _error = true;
    }
  }
  Future<void> postPatientRegister(Patient patient, int id)async{
    try{
      
      await UserDataProvider().postPatient(patient,  id);
      
    }catch(e) {
      _error = true;
    }
    
  }

  void setUser(UserUserDb? username) {
    _username = username;
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado
  }
}