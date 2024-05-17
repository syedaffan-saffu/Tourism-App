import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';
import 'package:trekkers_pk/homescreen/hmscrn.dart';
import 'package:trekkers_pk/main.dart';
import 'package:trekkers_pk/mainpage.dart';
import 'package:trekkers_pk/profile/profile.dart';
import 'package:trekkers_pk/profile/signinout/SignUp/signup.dart';
import '../../../reusabs/reusabs.dart';
import '../signinupcomps.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();
  NavigatorState nvgstate = NavigatorState();
  bool _fieldenable = true;
  bool _isemailvalid = false;
  bool _ispassvalid = false;
  bool _valid = false;
  Future _checklogin(String email, String pass, BuildContext context) async {
    final Map creds = {"email": email, "password": pass};
    final response = await http
        .post(Uri.parse("https://api.dev.trekkers.pk/login"), body: creds);
    if (response.statusCode == 200) {
      setState(() {
        _valid = true;
      });
    } else {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Unable to login")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider>(context, listen: false);
    final indexProv = Provider.of<IndexProvider>(context, listen: false);
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
                  enabled: _fieldenable,
                  controller: _emailcont,
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
                enabled: _fieldenable,
                controller: _passcont,
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
            SignInUpComps.loginbtn("Login", const Color(0xFF0561AB), () async {
              _valid = false;
              _fieldenable = false;
              print(_emailcont.text);
              print(_passcont.text);
              await _checklogin(_emailcont.text, _passcont.text, context);
              _valid
                  ? {
                      authProv.login(),
                      if (mounted)
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const Profile())),
                      indexProv.changeindex(0)
                    }
                  : () {};
              _fieldenable = true;
            }),
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
