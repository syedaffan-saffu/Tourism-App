import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ValidityLogin {
  static bool _fieldsValid(String email, String pass) {
    final bool valid;
    if (email.isEmpty || pass.isEmpty) {
      valid = false;
    } else {
      valid = true;
    }
    return valid;
  }

  static Future checklogin(String email, String pass,
      Function(bool) onValidationResult, BuildContext context) async {
    if (_fieldsValid(email, pass)) {
      final Map creds = {"email": email, "password": pass};
      final response = await http
          .post(Uri.parse("https://api.dev.trekkers.pk/login"), body: creds);
      if (response.statusCode == 200) {
        onValidationResult(true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Unable to login"),
          duration: Duration(seconds: 1),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Not All Fields are Filled"),
        duration: Duration(seconds: 1),
      ));
    }
  }
}
