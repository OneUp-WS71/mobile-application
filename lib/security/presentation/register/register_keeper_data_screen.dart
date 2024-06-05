import 'package:flutter/material.dart';
import 'package:mobile_application/common/styles/styles.dart';
import 'package:mobile_application/dataManagment/presentation/home/home_screen.dart';

class RegisterKeeperDataScreen extends StatelessWidget {
  const RegisterKeeperDataScreen({Key? key}) : super(key: key);

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
    //const SizedBox(height: 10),
    Padding(
    padding:EdgeInsets.all(16),
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
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Text(
      'Enter information about the older adult',
      style: TextStyle(
      fontSize: 28,
      fontFamily: Styles.headingFont,
      fontWeight: FontWeight.bold,
      color: Styles.primaryColor,
      ),
      ),
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
                Icons.person,
                color: Styles.primaryColor,
              ),
              contentPadding: EdgeInsets.all(10),
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
        padding:EdgeInsets.only(right: 230),
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
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your date of birth',
              prefixIcon: Icon(
                Icons.calendar_today,
                color: Styles.primaryColor,
              ),
              contentPadding: EdgeInsets.all(10),
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
        padding:EdgeInsets.only(right: 260),
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
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your address',
              prefixIcon: Icon(
                Icons.location_on,
                color: Styles.primaryColor,
              ),
              contentPadding: EdgeInsets.all(10),
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
        padding:EdgeInsets.only(right: 200),
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
              contentPadding: EdgeInsets.all(10),
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
        padding:EdgeInsets.only(right: 260),
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
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your weight',
              prefixIcon: Icon(
                Icons.monitor_weight,
                color: Styles.primaryColor,
              ),
              contentPadding: EdgeInsets.all(10),
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
        padding:EdgeInsets.only(right: 260),
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
            maxLines: 1,
            decoration: InputDecoration(
              hintText: 'Enter your height',
              prefixIcon: Icon(
                Icons.height,
                color: Styles.primaryColor,
              ),
              contentPadding: EdgeInsets.all(10),
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
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
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
