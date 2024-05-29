import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/security/presentation/register/terms_condition_screen.dart';

class RegisterKeeperScreen extends StatelessWidget {
  const RegisterKeeperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;

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
                            'CREATE A NEW ACCOUNT',
                            style: TextStyle(
                              fontSize: 28,
                              fontFamily: Styles.headingFont,
                              fontWeight: FontWeight.bold,
                              color: Styles.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:EdgeInsets.only(right: 300),
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
                            padding:EdgeInsets.only(right: 300),
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
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
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
                                hintText: 'Enter your password',
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
                          const SizedBox(height: 20),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Text(
                                  'I agree with the ',
                                ),
                                TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  TermsConditionScreen()),
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
                          Container(
                            width: 250,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: (){},
                              child: Text(
                                'SIGN UP',
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