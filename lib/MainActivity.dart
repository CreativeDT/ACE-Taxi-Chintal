import 'dart:convert';

import 'package:acetaxi/shared/BottomNavigationMenu.dart';
import 'package:acetaxi/shared/DrawerMenu.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class MainActivity extends StatelessWidget {
  const MainActivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MainActivityWidget(),
        drawer: DrawerMenu(),
        bottomNavigationBar: BottomNavigationMenu(),
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class MainActivityWidget extends StatefulWidget {
  const MainActivityWidget({Key? key}) : super(key: key);

  @override
  State<MainActivityWidget> createState() => _MainActivityWidgetState();
}

class _MainActivityWidgetState extends State<MainActivityWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextButton(
              onPressed: () {
                //alert dialog
                //showAlertDialog(context);

                //shared pref
                //String userid = asyncFunc();

                //api call
                fetchData();

              },
              child: Text(
                "Click here to select file",
                style: TextStyle(fontSize: 14, color: Colors.black),
              )),
        ],
      ),
    );
  }
}

asyncFunc() async {
  // Async func to handle Futures easier; or use Future.then
  SharedPreferences sf = await SharedPreferences.getInstance();
  sf.setString("userid", "12011");

  String? userid = sf.getString("userid");
  print("sharedpref->" + userid.toString());
}

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Select File'),
        content: Text('Click here to select document.'),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                PlatformFile file = result.files.first;

                // Handle the selected file, e.g., upload it to a server or process it.
                // You can access file.path to get the file's path on the device.
                // You can also use file.bytes to access the file's content as bytes.
              }

              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Click here'),
          ),
        ],
      );
    },
  );
}

Future<void> fetchData() async {
  String url = "https://api.publicapis.org/entries";

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON data.
    final data = json.decode(response.body);
    print("apiresponse->"+data);
    // Now you can use the 'data' variable to work with the response data.
  } else {
    // If the server did not return a 200 OK response, handle the error.
    throw Exception('Failed to load data');
  }
}

