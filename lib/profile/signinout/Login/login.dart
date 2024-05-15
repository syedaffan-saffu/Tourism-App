import 'package:flutter/material.dart';

import '../../../reusabs/reusabs.dart';
import '../signinupcomps.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());
  bool _isemailvalid = false;
  bool _ispassvalid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            sbh(50),
            Center(
              child: SizedBox(
                height: 60,
                child: Image.asset('assets/images/logon.png'),
              ),
            ),
            sbh(15),
            const Center(
              child: Text(
                "TREKKERS.PK",
                style: TextStyle(
                    fontFamily: "Orbitron",
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    height: 1.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                sbh(50),
                const Text(
                  "Wellcome to the Team!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            sbh(13),
            const Text(
              "Digitize your tour guide career by becoming a part of the team. Sign up with your email and set a password to get started with your profile!",
              style: TextStyle(
                fontSize: 17,
                color: Color(0xFF999999),
              ),
            ),
            sbh(20),
            SizedBox(
              height: 48,
              child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _isemailvalid = Validity.isEmailValid(value);
                    });
                  },
                  decoration: SignInUpComps.loginfields(
                      hint: "Email",
                      icon: Icons.person,
                      isvalid: _isemailvalid)),
            ),
            sbh(10),
            SizedBox(
              height: 48,
              child: TextField(
                controller: _controllers[1],
                onChanged: (value) {
                  setState(() {
                    _ispassvalid = Validity.isPassValid(value);
                  });
                },
                obscureText: true,
                obscuringCharacter: "*",
                decoration: SignInUpComps.loginfields(
                    hint: "Password", icon: Icons.key, isvalid: _ispassvalid),
              ),
            ),
            sbh(20),
            SignInUpComps.loginbtn("Login", const Color(0xFF0561AB), () {}),
            sbh(30),
            const Text(
              "Social Login",
              style: TextStyle(
                color: Color(0xFF999999),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SignInUpComps.socialbtn(
                    "Apple", Social.apple, Colors.black, () {}),
                SignInUpComps.socialbtn("Facebook", Social.facebook,
                    const Color(0xFF0561AB), () {}),
                SignInUpComps.socialbtn(
                    "Google", Social.google, const Color(0xFFEA1818), () {})
              ],
            )
          ]),
        ),
      ),
    );
  }
}
