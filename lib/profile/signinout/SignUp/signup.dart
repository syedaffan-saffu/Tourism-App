import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/profile/profile.dart';
import 'package:trekkers_pk/profile/signinout/Login/login.dart';
import 'package:trekkers_pk/profile/signinout/SignUp/signuputils.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

import '../../../backend/provider/providers.dart';
import '../signinupcomps.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<bool> _empties = [false, false, false, false];
  final TextEditingController _namecont = TextEditingController();
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();
  final TextEditingController _confrmpass = TextEditingController();
  bool _tapenabled = true;
  bool _logloading = false;
  bool _cloudvalid = false;

  void _onValidationResult(bool isValid) {
    setState(() {
      _cloudvalid = isValid;
    });
  }

  bool _isemailvalid = false,
      _ispassvalid = false,
      _iscnfrmpassvalid = false,
      _isnamevalid = false;

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthProvider2>(context, listen: false);
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
            TapRegion(
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 48,
                    child: TextField(
                      controller: _namecont,
                      onChanged: (value) {
                        setState(() {
                          _isnamevalid = Validity.isNameValid(value);
                          value.isNotEmpty ? _empties[0] = false : null;
                        });
                      },
                      decoration: SignInUpComps.loginfields(
                          isempty: _empties[0],
                          hint: "Name",
                          icon: Icons.person,
                          isvalid: _isnamevalid),
                    ),
                  ),
                  sbh(10),
                  SizedBox(
                    height: 48,
                    child: TextField(
                        controller: _emailcont,
                        onChanged: (value) {
                          setState(() {
                            _isemailvalid = Validity.isEmailValid(value);
                            value.isNotEmpty ? _empties[1] = false : null;
                          });
                        },
                        decoration: SignInUpComps.loginfields(
                            isempty: _empties[1],
                            hint: "Email",
                            icon: Icons.email,
                            isvalid: _isemailvalid)),
                  ),
                  sbh(10),
                  SizedBox(
                    height: 48,
                    child: TextField(
                      controller: _passcont,
                      onChanged: (value) {
                        setState(() {
                          _ispassvalid = Validity.isPassValid(value);
                          value.isNotEmpty ? _empties[2] = false : null;
                        });
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: SignInUpComps.loginfields(
                          isempty: _empties[2],
                          hint: "Password",
                          icon: Icons.key,
                          isvalid: _ispassvalid),
                    ),
                  ),
                  sbh(10),
                  SizedBox(
                    height: 48,
                    child: TextField(
                      controller: _confrmpass,
                      onChanged: (value) {
                        setState(() {
                          _iscnfrmpassvalid =
                              Validity.isCnfPassValid(_passcont.text, value);
                          value.isNotEmpty ? _empties[3] = false : null;
                        });
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: SignInUpComps.loginfields(
                          isempty: _empties[3],
                          hint: "Confirm Password",
                          icon: Icons.key,
                          isvalid: _iscnfrmpassvalid),
                    ),
                  ),
                ],
              ),
            ),
            sbh(20),
            Row(
              children: [
                SignInUpComps.loginbtn(
                    _logloading, "Sign Up", const Color(0xFF36A9E1), () {
                  _attemptValidandSignUp(authProv, indexProv);
                }),
                sbw(10),
                SignInUpComps.loginbtn(false, "Login", const Color(0xFF0561AB),
                    () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Login()));
                })
              ],
            ),
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

  void _attemptValidandSignUp(
      AuthProvider2 authProv, IndexProvider indexProv) async {
    _cloudvalid = false;
    _setchanges();

    if (_tapenabled) {
      _tapenabled = false;
      await ValiditySignUp.checksignup(
          _namecont.text,
          _emailcont.text,
          _passcont.text,
          _confrmpass.text,
          _isnamevalid,
          _isemailvalid,
          _ispassvalid,
          _iscnfrmpassvalid,
          _onValidationResult,
          context);

      _cloudvalid
          ? {
              authProv.login(),
              if (mounted)
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Profile())),
              indexProv.changeindex(0)
            }
          : {
              _tapenabled = true,
              setState(() {
                _logloading = false;
              })
            };
    }
  }

  void _setchanges() {
    setState(() {
      _empties[0] = _namecont.text.isEmpty;
      _empties[1] = _emailcont.text.isEmpty;
      _empties[2] = _passcont.text.isEmpty;
      _empties[3] = _confrmpass.text.isEmpty;
      _logloading = true;
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
