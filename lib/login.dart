import 'package:acetaxi/MainActivity.dart';
import 'package:acetaxi/shared/AppColors.dart';
import 'package:acetaxi/shared/AppValidation.dart';
import 'package:acetaxi/signup.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class loginpage extends StatelessWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: const LoginWidget(),
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  AppValidation appValidation = AppValidation();
  late bool isLoading = false;
  late bool isChecked = false;
  late String apiData;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isTermsAccepted = false;

  bool isFocusEmail = false;
  bool isFocusPassword = false;

  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNodeEmail.addListener(() {
      setState(() {
        isFocusEmail = _focusNodeEmail.hasFocus;
      });
    });

    _focusNodePassword.addListener(() {
      setState(() {
        isFocusPassword = _focusNodePassword.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 300.0,
              width: double.infinity,
              // alignment: FractionalOffset.center,
              child: new Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 72.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/login.png'),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 42.0),
                    height: 30.0,
                    alignment: Alignment.center,
                    child: const Text(
                      'ACE Taxi',
                      style: TextStyle(
                          color: AppColors.darkBlueTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(80),
                        topRight: Radius.circular(80))),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 24.0),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.0),
                      child: TextField(
                        focusNode: _focusNodeEmail,
                        decoration: InputDecoration(
                          prefixIconConstraints: BoxConstraints(),
                          labelText: "Email",
                          labelStyle: TextStyle(
                              color: isFocusEmail
                                  ? AppColors.primaryColor
                                  : AppColors.darkBlackTextColor,
                              fontSize:
                                  14.0 // Change label color based on focus
                              ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Image.asset(
                              'assets/mail.png',
                            ),
                          ),
                          hintText: "Enter your  Email",
                          hintStyle: TextStyle(
                              color: AppColors.hintTextColor, fontSize: 12.0),
                          border: UnderlineInputBorder(),
                        ),
                        controller: emailController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: TextField(
                        focusNode: _focusNodePassword,
                        decoration: InputDecoration(
                            prefixIconConstraints: BoxConstraints(),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                color: isFocusPassword
                                    ? AppColors.primaryColor
                                    : AppColors.darkBlackTextColor,
                                fontSize:
                                    14.0 // Change label color based on focus
                                ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Image.asset(
                                'assets/password.png',
                              ),
                            ),
                            hintText: "Enter your  Password",
                            hintStyle: TextStyle(
                                color: AppColors.hintTextColor, fontSize: 12.0),
                            border: UnderlineInputBorder()),
                        controller: passwordController,
                        obscureText: true,
                        // This makes the text obscure (i.e., a password field)
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: isChecked,
                            onChanged: (newValue) {
                              setState(() {
                                isChecked = newValue ?? false;
                              });
                            },
                          ),
                          Flexible(
                            child: Text(
                              'By proceeding, you agree to ACE Taxi Privacy Policy, User Agreement and T&Cs',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15.0),
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
                        onPressed: () async {
                          // Add your button's onPressed action here
                          if (emailController.text.trim().isEmpty) {
                            showToast("Enter Email");
                          } else if (!appValidation
                              .isEmailValid(emailController.text.trim())) {
                            showToast("Enter valid email");
                          } else if (passwordController.text.trim().isEmpty) {
                            showToast("Enter password");
                          } else if (!appValidation.isPasswordValid(
                              passwordController.text.trim())) {
                            showToast(
                                'Password is not valid! (At least 8 characters, 1 uppercase, 1 lowercase, 1 digit)');
                          } else if (!isChecked) {
                            showToast("Accept terms & condition to proceed");
                          } else {
                            if (await isInternetConnected()) {
                              fetchLoginData(emailController.text.trim(),
                                  passwordController.text.trim());
                            } else {
                              showToast("No internet available");
                            }
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot Password",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500),
                            )),
                        Row(
                          children: <Widget>[
                            Text('Don’t have account'),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                },
                                child: const Text(
                                  "Sign up",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

/*  Future<void> fetchLoginData() async {
    String url = "http://172.16.116.221:8080/acetaxi/admin/getAllDrivers";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON data.
      final data = json.decode(response.body);
      print("apiresponse->" + data.toString());
      // Now you can use the 'data' variable to work with the response data.
    } else {
      // If the server did not return a 200 OK response, handle the error.
      throw Exception('Failed to load data');
    }
  }*/

  Future<void> fetchLoginData(String email, String password) async {
    print("email" + email);
    print("password" + password);

    final url = Uri.parse(
        'http://172.16.116.221:8080/acetaxi/driver/login?email=$email&password=$password');
    print("url" + url.toString());

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Successful GET request, handle the response.
      print(response.body);
      showToast("login successful");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainActivity()));
    } else {
      // Handle errors here.
      showToast("login failed");
      print('Failed to load data');
    }
  }

  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    // Duration of the toast (SHORT or LONG)
    gravity: ToastGravity.BOTTOM,
    // Position of the toast on the screen
    timeInSecForIosWeb: 1,
    // Time in seconds for iOS and web
    backgroundColor: Colors.black54,
    // Background color of the toast
    textColor: Colors.white,
    // Text color of the toast
    fontSize: 16.0, // Font size of the message
  );
}

bool validatePassword(String password) {
  // Define your password validation criteria here
  // For this example, we'll check if the password length is at least 6 characters
  return password.length >= 6;
}
