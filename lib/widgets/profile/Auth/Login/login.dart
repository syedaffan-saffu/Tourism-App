import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';
import 'package:trekkers_pk/widgets/profile/Auth/Login/loginutils.dart';
import 'package:trekkers_pk/backend/router/routes.dart';
import '../../../../utils/utilspack1.dart';
import '../authcomps.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<bool> _isfieldempty = [false, false];
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();
  bool _loading = false;
  bool _tapenabled = true;
  bool _fieldenable = true;
  bool _isemailvalid = false, _ispassvalid = false;
  bool _isserverauthvalid = false;

  @override
  void initState() {
    super.initState();
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
                  style: const TextStyle(fontFamily: "Montserrat"),
                  enabled: _fieldenable,
                  controller: _emailcont,
                  onChanged: (value) {
                    setState(() {
                      _isemailvalid = ValidityUtils.isEmailValid(value);
                    });
                  },
                  decoration: AuthComps.loginfields(
                      isempty: _isfieldempty[0],
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
                    _ispassvalid = ValidityUtils.isPassValid(value);
                  });
                },
                obscureText: true,
                obscuringCharacter: "*",
                decoration: AuthComps.loginfields(
                    isempty: _isfieldempty[1],
                    hint: "Password",
                    icon: Icons.key,
                    isvalid: _ispassvalid),
              ),
            ),
            sbh(20),
            AuthComps.loginbtn(_loading, "Login", const Color(0xFF0561AB),
                () async {
              _isserverauthvalid = false;
              setState(() {
                _isfieldempty[0] = _emailcont.text.isEmpty;
                _isfieldempty[1] = _passcont.text.isEmpty;
                _loading = true;
                FocusManager.instance.primaryFocus?.unfocus();
              });

              if (_tapenabled) {
                _tapenabled = false;
                await AuthorizeLogin.auth(_emailcont.text, _passcont.text,
                    _onValidationResult, context);

                _isserverauthvalid
                    ? {
                        authProv.login(),
                        sectionDNavigatorKey.currentState!.pop(),
                        GoRouter.of(context).go("/home"),
                        setState(() {
                          indexProv.changeindex(0);
                          _loading = false;
                        })
                      }
                    : {
                        _tapenabled = true,
                        _fieldenable = true,
                        setState(() {
                          _loading = false;
                        })
                      };
              }
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
                AuthComps.socialbtn("Apple", Social.apple, Colors.black, () {}),
                AuthComps.socialbtn("Facebook", Social.facebook,
                    const Color(0xFF0561AB), () {}),
                AuthComps.socialbtn(
                    "Google", Social.google, const Color(0xFFEA1818), () {})
              ],
            )
          ]),
        ),
      ),
    );
  }

  void _onValidationResult(bool isValid) {
    setState(() {
      _isserverauthvalid = isValid;
    });
  }
}
