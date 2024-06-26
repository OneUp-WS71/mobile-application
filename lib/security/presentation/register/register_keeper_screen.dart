import 'package:flutter/material.dart';

import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/security/application/datasources/provider.dart';
import 'package:mobile_application/security/application/models/user_userdb.dart';
import 'package:mobile_application/security/presentation/register/widgets/terms_condition_screen.dart';
import 'package:mobile_application/security/presentation/register/register_keeper_data_screen.dart';
import 'package:provider/provider.dart';

class RegisterKeeperScreen extends StatefulWidget {
  RegisterKeeperScreen({Key? key}) : super(key: key);

  @override
  State<RegisterKeeperScreen> createState() => _RegisterKeeperScreenState();
}

class _RegisterKeeperScreenState extends State<RegisterKeeperScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  UserUserDb? userDetail;
  bool _error = false;
  
  @override
  void initState(){
    super.initState();  
    
  }



  @override
  Widget build(BuildContext context) {

    bool isChecked = false;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    
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
                        height: 120,
                        child: Image(
                          image: AssetImage('assets/icons/logo-elderlycare.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(height: screenHeight * 0.01),
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
                            Center(
                              child: Text(
                                'CREATE NEW ACCOUNT',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: Styles.headingFont,
                                  fontWeight: FontWeight.bold,
                                  color: Styles.primaryColor,
                                ),
                              ),
                            ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:EdgeInsets.only(right: screenWidth * 0.60),
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
                                controller: _emailController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email',
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
                            padding:EdgeInsets.only(right: screenWidth * 0.60),
                            child: Text(
                              'Username',
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
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
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
                          const SizedBox(height: 20),
                          const SizedBox(height: 10),
                          Padding(
                            padding:EdgeInsets.only(right: screenWidth * 0.60),
                            child: Text(
                              'Name',
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
                              controller: _nameController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
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
                          const SizedBox(height: 10),
                          Padding(
                            padding:EdgeInsets.only(right: screenWidth * 0.60),
                            child: Text(
                              'lasname',
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
                              controller: _lastnameController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Enter your lastname',
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
                          const SizedBox(height: 10),
                          Padding(
                            padding:EdgeInsets.only(right: screenWidth * 0.60),
                            child: Text(
                              'phone',
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
                              controller: _phoneController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Enter your phone',
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                const Text(
                                  'I agree with the ',
                                ),
                                TextButton(
                                  onPressed: (){
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {  return const TermsConditionScreen();
                                      }
                                    );
                                  },
                                  child: Text(
                                    'Terms and Conditions',
                                    style: TextStyle(
                                      color: Styles.primaryColor,
                                      fontSize: 16,
                                      fontFamily: Styles.headingFont,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Checkbox(
                                  checkColor: Styles.primaryColor,
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    isChecked = value!;
                                  },
                                ),
                              ]
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: (){
                                print('-----username221311------- ${Provider.of<UserModel>(context, listen: false).username}');
                                if (Provider.of<UserModel>(context, listen: false).username != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterKeeperDataScreen(),
                                    ),
                                  );
                                }
                                UserUserDb user = UserUserDb(
                                  id: 0, username: _usernameController.text, name: _nameController.text, lastname: _lastnameController.text, phone: _phoneController.text , password: _passwordController.text, email: _emailController.text, patients: []);
                                Provider.of<UserModel>(context, listen: false).postRegister(context, user);

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Styles.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: Styles.headingFont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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