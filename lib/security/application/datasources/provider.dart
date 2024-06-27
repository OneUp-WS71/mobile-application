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

  Future<void> fetchUserDetail(String username, String password) async {
    try{
        _username = await UserDataProvider().getUserByName(username);
        if(_username?.password != password){
          _error = true;
        }
    }
    catch(e){
        _error = true;
    }

    }

  Future<void> postRegister( BuildContext context, UserUserDb user)async{
    try{
      
      _username2 = await UserDataProvider().postUser(user);




      
      
    }catch(e) {

    }
  }
  Future<void> postPatientRegister(Patient patient, int id)async{
    try{
      
      await UserDataProvider().postPatient(patient,  id);
      
    // ignore: empty_catches
    }catch(e) {
    }
    
  }

  void setUser(UserUserDb? username) {
    _username = username;
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado
  }
  void seterror(UserUserDb? username) {
    _username = username;
    notifyListeners(); // Notifica a los oyentes que el estado ha cambiado
  }
}