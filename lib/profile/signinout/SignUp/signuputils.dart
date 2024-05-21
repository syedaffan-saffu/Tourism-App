import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ValiditySignUp {
  static bool _fieldsValid(
      String name, String email, String pass, String cnfrmpass) {
    final bool valid;
    if (name.isEmpty || email.isEmpty || pass.isEmpty || cnfrmpass.isEmpty) {
      valid = false;
    } else {
      valid = true;
    }
    return valid;
  }

  static Future checksignup(
      String name,
      String email,
      String pass,
      String cnfrmpass,
      Function(bool) onValidationResult,
      BuildContext context) async {
    if (ValiditySignUp._fieldsValid(name, email, pass, cnfrmpass)) {
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
        content: Text("Not All fields are filled"),
        duration: Duration(seconds: 1),
      ));
    }
  }
}
