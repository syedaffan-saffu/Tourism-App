import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trekkers_pk/utils/utilspack1.dart';
import 'package:trekkers_pk/utils/utilspack2.dart';

class AuthorizeLogin {
  static Future auth(String email, String pass,
      Function(bool) onValidationResult, BuildContext context) async {
    if (_ValidateLoginFields.arefieldsValid(email, pass)) {
      final Map creds = {"email": email, "password": pass};
      final response =
          await http.post(Uri.parse("${AuthUtils.apiurl}/login"), body: creds);

      if (response.statusCode == 200) {
        onValidationResult(true);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(UtilsPack2.snackBar("Unable to Login", 1));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          UtilsPack2.snackBar("Not All Fields are Filled or Valid", 1));
    }
  }
}

abstract class _ValidateLoginFields {
  static bool arefieldsValid(String email, String pass) {
    final bool valid;
    if (email.isEmpty || pass.isEmpty) {
      valid = false;
    } else {
      valid = true;
    }
    return valid;
  }
}
