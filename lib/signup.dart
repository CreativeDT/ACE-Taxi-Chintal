import 'package:acetaxi/MainActivity.dart';
import 'package:acetaxi/login.dart';
import 'package:acetaxi/shared/AppColors.dart';
import 'package:acetaxi/shared/AppValidation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Signup",
      home: Scaffold(
        backgroundColor: AppColors.bgColor,
        body: const SignupWidget(),
      ),
    );
  }
}

class SignupWidget extends StatefulWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  State<SignupWidget> createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  bool isChecked = false;
  AppValidation appValidation = AppValidation();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reenterPasswordController = TextEditingController();
  bool value = false;

  bool isFocusedFname = false;
  bool isFocusedLname = false;
  bool isFocusedMobile = false;
  bool isFocusedEmail = false;
  bool isFocusedPassword = false;
  bool isFocusedRePassword = false;

  FocusNode _focusNodeFname = FocusNode();
  FocusNode _focusNodeLname = FocusNode();
  FocusNode _focusNodeMobile = FocusNode();
  FocusNode _focusNodeEmail = FocusNode();
  FocusNode _focusNodePassword = FocusNode();
  FocusNode _focusNodeRePassword = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNodeFname.addListener(() {
      setState(() {
        isFocusedFname = _focusNodeFname.hasFocus;
      });
    });

    _focusNodeLname.addListener(() {
      setState(() {
        isFocusedLname = _focusNodeLname.hasFocus;
      });
    });

    _focusNodeMobile.addListener(() {
      setState(() {
        isFocusedMobile = _focusNodeMobile.hasFocus;
      });
    });

    _focusNodeEmail.addListener(() {
      setState(() {
        isFocusedEmail = _focusNodeEmail.hasFocus;
      });
    });

    _focusNodePassword.addListener(() {
      setState(() {
        isFocusedPassword = _focusNodePassword.hasFocus;
      });
    });

    _focusNodeRePassword.addListener(() {
      setState(() {
        isFocusedRePassword = _focusNodeRePassword.hasFocus;
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
              child: SingleChildScrollView(
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
                          'Signup',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 24),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.0),
                        child: TextField(
                          focusNode: _focusNodeFname,
                          decoration: InputDecoration(
                              prefixIconConstraints: BoxConstraints(),
                              labelText: "First name",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/mail.png',
                                ),
                              ),
                              hintText: "Enter First Name",
                              labelStyle: TextStyle(
                                  color: isFocusedFname
                                      ? AppColors.primaryColor
                                      : AppColors.darkBlackTextColor,
                                  fontSize:
                                      14.0 // Change label color based on focus
                                  ),
                              hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                  fontSize: 12.0),
                              border: UnderlineInputBorder()),
                          controller: firstNameController,
                          keyboardType: TextInputType.text,
                        ),
                      ), //firstname
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: TextField(
                          focusNode: _focusNodeLname,
                          decoration: InputDecoration(
                              prefixIconConstraints: BoxConstraints(),
                              labelText: "Last name",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/mail.png',
                                ),
                              ),
                              hintText: "Enter Last Name",
                              labelStyle: TextStyle(
                                  color: isFocusedLname
                                      ? AppColors.primaryColor
                                      : AppColors.darkBlackTextColor,
                                  fontSize:
                                      14.0 // Change label color based on focus
                                  ),
                              hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                  fontSize: 12.0),
                              border: UnderlineInputBorder()),
                          controller: lastNameController,
                          keyboardType: TextInputType.text,
                        ),
                      ), //lastname
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: TextField(
                          focusNode: _focusNodeMobile,
                          decoration: InputDecoration(
                              prefixIconConstraints: BoxConstraints(),
                              labelText: "Mobile",
                              prefixText: '+1',
                              prefixStyle: TextStyle(
                                  color: AppColors.greyColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/call.png',
                                ),
                              ),
                              hintText: "Enter Mobile Number",
                              labelStyle: TextStyle(
                                  color: isFocusedMobile
                                      ? AppColors.primaryColor
                                      : AppColors.darkBlackTextColor,
                                  fontSize:
                                      14.0 // Change label color based on focus
                                  ),
                              hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                  fontSize: 12.0),
                              border: UnderlineInputBorder()),
                          controller: mobileController,
                          keyboardType: TextInputType.number,
                        ),
                      ), //mobile
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: TextField(
                          focusNode: _focusNodeEmail,
                          decoration: InputDecoration(
                              prefixIconConstraints: BoxConstraints(),
                              labelText: "Email",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/mail.png',
                                ),
                              ),
                              hintText: "Enter your  Email",
                              labelStyle: TextStyle(
                                  color: isFocusedEmail
                                      ? AppColors.primaryColor
                                      : AppColors.darkBlackTextColor,
                                  fontSize:
                                      14.0 // Change label color based on focus
                                  ),
                              hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                  fontSize: 12.0),
                              border: UnderlineInputBorder()),
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ), //email
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: TextField(
                          focusNode: _focusNodePassword,
                          decoration: InputDecoration(
                              prefixIconConstraints: BoxConstraints(),
                              labelText: "Password",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/password.png',
                                ),
                              ),
                              hintText: "Enter your Password",
                              labelStyle: TextStyle(
                                  color: isFocusedPassword
                                      ? AppColors.primaryColor
                                      : AppColors.darkBlackTextColor,
                                  fontSize:
                                      14.0 // Change label color based on focus
                                  ),
                              hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                  fontSize: 12.0),
                              border: UnderlineInputBorder()),
                          controller: passwordController,
                        ),
                      ), //password
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: TextField(
                          focusNode: _focusNodeRePassword,
                          decoration: InputDecoration(
                              prefixIconConstraints: BoxConstraints(),
                              labelText: "Re-Enter Password",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Image.asset(
                                  'assets/password.png',
                                ),
                              ),
                              hintText: "Re-Enter Password",
                              labelStyle: TextStyle(
                                  color: isFocusedRePassword
                                      ? AppColors.primaryColor
                                      : AppColors.darkBlackTextColor,
                                  fontSize:
                                      14.0 // Change label color based on focus
                                  ),
                              hintStyle: TextStyle(
                                  color: AppColors.hintTextColor,
                                  fontSize: 12.0),
                              border: UnderlineInputBorder()),
                          controller: reenterPasswordController,
                        ),
                      ), //reenter password
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
                      ), // checkbox
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

                            if (firstNameController.text.trim().isEmpty) {
                              showToast("Enter First Name");
                            } else if (!appValidation.isFullnameValid(
                                firstNameController.text.trim())) {
                              showToast("Enter valid First name");
                            } else if (lastNameController.text.trim().isEmpty) {
                              showToast("Enter Last Name");
                            } else if (!appValidation.isFullnameValid(
                                lastNameController.text.trim())) {
                              showToast("Enter valid Last name");
                            } else if (mobileController.text.trim().isEmpty) {
                              showToast("Enter mobile");
                            } else if (!appValidation
                                .isValidMobile(mobileController.text.trim())) {
                              showToast("Enter valid mobile");
                            } else if (emailController.text.trim().isEmpty) {
                              showToast("Enter Email");
                            } else if (!appValidation
                                .isEmailValid(emailController.text.trim())) {
                              showToast("Enter valid Email");
                            } else if (passwordController.text.trim().isEmpty) {
                              showToast("Enter password");
                            } else if (!appValidation.isPasswordValid(
                                passwordController.text.trim())) {
                              showToast(
                                  'Password is not valid! (At least 6 characters, 1 uppercase, 1 lowercase, 1 digit)');
                            } else if (passwordController.text.trim() !=
                                reenterPasswordController.text.trim()) {
                              showToast(
                                  "Password and confirm pasword does not match");
                            } else if (!isChecked) {
                              showToast("Accept terms & condition to proceed");
                            } else {
                              if (await isInternetConnected()) {
                                fetchSignupData(
                                    firstNameController.text.trim(),
                                    lastNameController.text.trim(),
                                    mobileController.text.trim(),
                                    emailController.text.trim(),
                                    passwordController.text.trim(),
                                    true);
                              } else {
                                showToast("No internet available");
                              }
                            }
                            /*   Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainActivity()));

                            showToast("Signup successful");*/
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ), //gradient button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Already have an account'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const loginpage()));
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> fetchSignupData(String firstname, String lastname, String mobile,
      String email, String password, bool checkbox) async {
    print("firstname" + firstname);
    print("lastname" + lastname);
    print("mobile" + mobile);
    print("email" + email);
    print("password" + password);

    final url = Uri.parse(
        'http://172.16.116.221:8080/acetaxi/driver/login?firstName=$firstname&lastName=$lastname&mobileNumber=$mobile&email=$email&password=$password&repassword=$password&checkbox=$checkbox');
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
    fontSize: 6.0, // Font size of the message
  );
}

bool validatePassword(String password) {
  // Define your password validation criteria here
  // For this example, we'll check if the password length is at least 6 characters
  return password.length >= 6;
}

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return AppColors.primaryColor;
      }
      return AppColors.greyColor;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
