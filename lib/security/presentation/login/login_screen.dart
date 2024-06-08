import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/application/infrastructure/model/userdb/user_userdb.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/security/presentation/register/register_keeper_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  dynamic userDetail;
  @override
  void initState(){
    super.initState();
    getUserById(1);

  }
  final dio = Dio(
    BaseOptions(baseUrl: 'https://oneupbackend.zeabur.app/api/oneup/v1')
  );

  Future<dynamic> getUserById(int userId) async{
    final response = await dio.get('/users/$userId');
    if (response.statusCode != 200)
      throw Exception('User with id: $userId not found');

    userDetail = UserUserDb.fromJson(response.data);
    final data = response.data;
    print('------response------- $response');
    print('------response------- $data');
    print('------Hola------- $userDetail');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                padding:EdgeInsets.all(20),
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
                        'Login',
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: Styles.headingFont,
                          fontWeight: FontWeight.bold,
                          color: Styles.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding:EdgeInsets.only(right: 280),
                        child: Text(
                          'Email',
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
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Enter your email',
                            prefixIcon: Icon(
                              Icons.person,
                              color: Styles.primaryColor,
                            ),
                            contentPadding: EdgeInsets.all(20),
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
                        padding:EdgeInsets.only(right: 250),
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
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: 'Confirm your password',
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Styles.primaryColor,
                            ),
                            contentPadding: EdgeInsets.all(20),
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
                      const SizedBox(height: 10),
                      Padding(
                          padding:EdgeInsets.only(left: 200),
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
                      Container(
                        width: 250,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: Styles.headingFont,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Styles.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Text(
                            'Don\'t have an account?',
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterKeeperScreen(),
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