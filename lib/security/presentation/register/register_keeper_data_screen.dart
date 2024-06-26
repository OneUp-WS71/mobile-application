import 'package:flutter/material.dart';

import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/dataManagment/presentation/home/home_screen.dart';
import 'package:mobile_application/security/application/datasources/provider.dart';
import 'package:mobile_application/security/application/datasources/user_datasources.dart';
import 'package:mobile_application/security/application/models/user_userdb.dart';
import 'package:provider/provider.dart';

class RegisterKeeperDataScreen extends StatefulWidget {

  const RegisterKeeperDataScreen({Key? key}) : super(key: key);

  @override
  State<RegisterKeeperDataScreen> createState() => _RegisterKeeperDataScreenState();
}

class _RegisterKeeperDataScreenState extends State<RegisterKeeperDataScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  late final int id;
  bool _error = false;
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final userModel = Provider.of<UserModel>(context);
    return Container(
        decoration: BoxDecoration(
        color: Styles.primaryColor),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Form(
    child: ListView(
    children: [
    //const SizedBox(height: 10),
    Padding(
    padding:const EdgeInsets.all(16),
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
    Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: Text(
        'Enter information of the older adult',
        style: TextStyle(
        fontSize: 28,
        fontFamily: Styles.headingFont,
        fontWeight: FontWeight.bold,
        color: Styles.primaryColor,
        ),
        ),
      ),
    ),
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
            controller: _usernameController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              prefixIcon: Icon(
                Icons.person,
                color: Styles.primaryColor,
              ),
              contentPadding: const EdgeInsets.all(10),
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
        padding:EdgeInsets.only(right: screenWidth * 0.45),
        child: Text(
          'Date of birth',
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
            controller: _dateController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your date of birth',
              prefixIcon: Icon(
                Icons.calendar_today,
                color: Styles.primaryColor,
              ),
              contentPadding: const EdgeInsets.all(10),
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
        padding:EdgeInsets.only(right: screenWidth * 0.55),
        child: Text(
          'Address',
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
            controller: _addressController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your address',
              prefixIcon: Icon(
                Icons.location_on,
                color: Styles.primaryColor,
              ),
              contentPadding: const EdgeInsets.all(10),
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
        padding:EdgeInsets.only(right: screenWidth * 0.45),
        child: Text(
          'Familly phone',
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
              hintText: 'Enter your phone number',
              prefixIcon: Icon(
                Icons.phone,
                color: Styles.primaryColor,
              ),
              contentPadding: const EdgeInsets.all(10),
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
          'Weight',
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
            controller: _weightController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your weight',
              prefixIcon: Icon(
                Icons.monitor_weight,
                color: Styles.primaryColor,
              ),
              contentPadding: const EdgeInsets.all(10),
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
          'Height',
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
            controller: _heightController,
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your height',
              prefixIcon: Icon(
                Icons.height,
                color: Styles.primaryColor,
              ),
              contentPadding: const EdgeInsets.all(10),
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
      const SizedBox(height: 20),
      Container(
        width: 250,
        height: 50,
        child: ElevatedButton(
          onPressed: () async {
            Patient patient = Patient(
              id: 0, 
              name: _usernameController.text, 
              address: _addressController.text, 
              date: _dateController.text, 
              weight: double.parse(_weightController.text), 
              height: double.parse(_heightController.text));

            await Provider.of<UserModel>(context).postPatientRegister(patient, userModel.username!.id);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );

          },
          child: Text(
            'Register',
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
      const SizedBox(height: 15),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    )
    );
  }
}
