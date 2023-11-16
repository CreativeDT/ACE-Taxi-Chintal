import 'package:acetaxi/login.dart';
import 'package:acetaxi/shared/AppColors.dart';
import 'package:acetaxi/signup.dart';
import 'package:flutter/material.dart';

class welcomePage extends StatelessWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Ace Taxi",
            style: TextStyle(
                color: AppColors.darkBlueTextColor,
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: AppColors.primaryColorLight,
        ),
        body: const WelcomeWidget(),
      ),
    );
  }
}

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/welcome.png'),
                  fit: BoxFit.fitHeight),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 42.0),
            child: const Text(
              "Join the ACE Taxi! Register now to secure your place in the queue",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.darkBlackTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 28),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              "Available whenever you need us! Reach out 24/7, 365 days a year to get a taxi ride worth repeating.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.lightBlackTextColor,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.12,
                  fontSize: 16),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                margin: EdgeInsets.only(top: 42.0),
                width: double.infinity,
                height: 46,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    // Adjust the radius to your liking
                    //border: Border.all(color: AppColors.primaryColor, width: 2),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.primaryColor,
                        AppColors.primaryColorDark
                      ],
                      // Define the colors for the gradient
                      begin: Alignment.centerLeft,
                      // Adjust the gradient start point
                      end: Alignment
                          .centerRight, // Adjust the gradient end point
                    )),
                child: MaterialButton(
                  onPressed: () {
                    // Add your button's onPressed action here
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => loginpage()));
                  },
                  child: Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 26.0),
                width: double.infinity,
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  // Adjust the radius to your liking
                  border: Border.all(color: AppColors.primaryColor, width: 1),
                ),
                child: MaterialButton(
                  onPressed: () {
                    // Add your button's onPressed action here
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignupPage()));
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(color: AppColors.primaryColor,fontSize: 18,fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
