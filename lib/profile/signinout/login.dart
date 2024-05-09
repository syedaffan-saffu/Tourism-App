import 'package:flutter/material.dart';
import 'package:trekkers_pk/profile/profile.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileComps.appBar("Login"),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(child: Text("Login Or Register to Proceed")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Register"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("cancel"))
          ],
        )
      ]),
    );
  }
}
