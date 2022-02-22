import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../index.dart';

bool validateEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    // errorEmail = true;
    return true;
    // AppUtil().showAlert("Email is Required");
    // return "Email is Required";
    // return false;
  } else if (!regExp.hasMatch(value)) {
    // errorEmail = true;
    return true;
    // AppUtil().showAlert("Invalid Email");
    // return "Invalid Email";
    // return false;
  } else {
    // errorEmail = false;
    return false;
    // return 'valid';
    // return true;
  }
}

bool validatePassword(String value) {
  String pattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    // errorEmail = true;
    return true;
    // AppUtil().showAlert("Email is Required");
    // return "Email is Required";
    // return false;
  } else if (!regExp.hasMatch(value)) {
    // errorEmail = true;
    return true;
    // AppUtil().showAlert("Invalid Email");
    // return "Invalid Email";
    // return false;
  } else {
    // errorEmail = false;
    return false;
    // return 'valid';
    // return true;
  }
}

//"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"

class InternetConnection {
  static bool connection = true;
}

Future<dynamic> apiRequest(String url, Map jsonMap, {dynamic user}) async {
  var body = json.encode(jsonMap);
  var response;

  try {
    response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    Map<dynamic, dynamic> t = json.decode(response.body);
    InternetConnection.connection = true;
    if (t.containsKey('error')) {
      return t;
    }

    return t;
  } catch (err) {
    InternetConnection.connection = false;
  }
}

String timeDifference(String endedAt) {
  var endDate = DateTime.parse(endedAt).toLocal();
  var currentDate = DateTime.now();
  var difference = endDate.difference(currentDate);
  return "${difference.toString().substring(0, 5)}";
}

String randomStringGenerator(int len) {
  var r = Random();
  return List.generate(
      len, (index) => Strings.chars[r.nextInt(Strings.chars.length)]).join();
}
