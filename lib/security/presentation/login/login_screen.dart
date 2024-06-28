import 'package:flutter/material.dart';

import 'package:mobile_application/elderlyProfile/presentation/profile/profile_screen.dart';
import 'package:mobile_application/security/application/datasources/provider.dart';
import 'package:mobile_application/security/application/datasources/user_datasources.dart';
import 'package:mobile_application/security/application/models/user_userdb.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/security/presentation/register/register_keeper_screen.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  UserUserDb? userDetail;
  bool _error = false;
  @override
  void initState(){
    super.initState();
    
    
  }
  Future<void> fetchUserDetail(String username) async {
    print('---username--- $username');
    try {
      userDetail = await UserDataProvider().getUserByName(username);
      print('---userDetail--- $userDetail');
      if (userDetail?.username == _usernameController.text &&
          userDetail?.password == _passwordController.text) {
        _error = false;
      } else {
        _error = true;
      }
    } catch (e) {
      _error = true;
    }
    setState(() {});
    if (_error) {
      _showErrorDialog();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    }
  }
  void _showErrorDialog(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Column(
              children: [
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(height: 10),
                Text('The Username or Password is Incorrect. Try again',
                textAlign:TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: Styles.headingFont,
                  fontWeight: FontWeight.bold,
                ),
                  ),
              ],
            ),
          ),
          actions: [
            SizedBox(
              height: 40,
              width: 90,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Styles.primaryColor,
                ),
                child: Text('OK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: Styles.headingFont,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        );
      },
    );

  }
@override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final userModel = Provider.of<UserModel>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (userModel.username != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          ),
        );
      }
    });
    return Container(
        decoration: BoxDecoration(
        color: Styles.primaryColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Form(
          child: ListView(
            children: [
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 150,
                    child: Image(
                      image: AssetImage('assets/icons/logo-elderlycare.png'),
                      fit: BoxFit.contain,
                    ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding:const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const[
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0,5)
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                       Text(
                        "Login ",
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: Styles.headingFont,
                          fontWeight: FontWeight.bold,
                          color: Styles.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding:EdgeInsets.only(right: screenWidth * 0.50),
                        child: Text(
                          'username',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: Styles.headingFont,
                            fontWeight: FontWeight.bold,
                            color: Styles.primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 30),
                        child: TextFormField(
                          controller: _usernameController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Enter your username',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Styles.primaryColor,
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            hintStyle:  const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Styles.primaryColor,
                              ),
                            ),
                            ),
                          )

                        ),
                      const SizedBox(height: 10),
                      Padding(
                        padding:EdgeInsets.only(right: screenWidth * 0.50),
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: Styles.headingFont,
                            fontWeight: FontWeight.bold,
                            color: Styles.primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 30),
                        child: TextFormField(
                          controller: _passwordController,
                          maxLines: 1,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Confirm your password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Styles.primaryColor,
                            ),
                            contentPadding: const EdgeInsets.all(20),
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Styles.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(),
                      
                      const SizedBox(height: 10),
                      Padding(
                          padding:EdgeInsets.only(left: screenWidth * 0.40),
                          child: TextButton(
                            onPressed: (){},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Styles.primaryColor,
                                fontSize: 16,
                                fontFamily: Styles.headingFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            if (_usernameController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              setState(() {
                                _error = true;
                              });
                              _showErrorDialog();
                            } else {
                              fetchUserDetail(_usernameController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: Styles.headingFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          const Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                            onPressed: (){
                              Provider.of<UserModel>(context, listen: false).setUser(null);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  RegisterKeeperScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Styles.primaryColor,
                                fontSize: 16,
                                fontFamily: Styles.headingFont,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]
                      ),
                      const SizedBox(height: 20),

                    ],
                  ),
                ),
                  ) ,
            ],
          ),
        )
      )
    );
  }
}