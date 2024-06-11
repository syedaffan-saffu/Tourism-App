import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class AuthandValidateSignUp {
  static bool _arefieldsValid(String name, String email, String pass,
      String cnfrmpass, bool valid1, bool valid2, bool valid3, bool valid4) {
    final bool valid;
    if (name.isEmpty ||
        email.isEmpty ||
        pass.isEmpty ||
        cnfrmpass.isEmpty ||
        !valid1 ||
        !valid2 ||
        !valid3 ||
        !valid4) {
      valid = false;
    } else {
      valid = true;
    }
    return valid;
  }

  static Future authsignup(
      String name,
      String email,
      String pass,
      String cnfrmpass,
      bool valid1,
      bool valid2,
      bool valid3,
      bool valid4,
      Function(bool) onValidationResult,
      BuildContext context) async {
    if (_arefieldsValid(
        name, email, pass, cnfrmpass, valid1, valid2, valid3, valid4)) {
      final Map creds = {"name": name, "email": email, "password": pass};
      final response = await http
          .post(Uri.parse("https://api.dev.trekkers.pk/register"), body: creds);
      if (response.statusCode == 302 || response.statusCode == 200) {
        onValidationResult(true);
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Unable to login"),
          duration: Duration(seconds: 1),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Not All fields are filled or Valid"),
        duration: Duration(seconds: 1),
      ));
    }
  }
}
