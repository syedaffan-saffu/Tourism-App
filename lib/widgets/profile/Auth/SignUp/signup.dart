import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/widgets/profile/Auth/SignUp/signuputils.dart';
import 'package:trekkers_pk/utils/utilspack1.dart';
import '../../../../backend/provider/providers.dart';
import '../authcomps.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final List<bool> _emptyfields = [false, false, false, false];
  final TextEditingController _namecont = TextEditingController();
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();
  final TextEditingController _confrmpass = TextEditingController();
  bool _tapenabled = true;
  bool _loading = false;
  bool _isserverauthvalid = false;

  void _onValidationResult(bool isValid) {
    setState(() {
      _isserverauthvalid = isValid;
    });
  }

  bool _isemailvalid = false,
      _ispassvalid = false,
      _iscnfrmpassvalid = false,
      _isnamevalid = false;

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
                          _isnamevalid = ValidityUtils.isNameValid(value);
                          value.isNotEmpty ? _emptyfields[0] = false : null;
                        });
                      },
                      decoration: AuthComps.loginfields(
                          isempty: _emptyfields[0],
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
                            _isemailvalid = ValidityUtils.isEmailValid(value);
                            value.isNotEmpty ? _emptyfields[1] = false : null;
                          });
                        },
                        decoration: AuthComps.loginfields(
                            isempty: _emptyfields[1],
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
                          _ispassvalid = ValidityUtils.isPassValid(value);
                          value.isNotEmpty ? _emptyfields[2] = false : null;
                        });
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: AuthComps.loginfields(
                          isempty: _emptyfields[2],
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
                          _iscnfrmpassvalid = ValidityUtils.isCnfPassValid(
                              _passcont.text, value);
                          value.isNotEmpty ? _emptyfields[3] = false : null;
                        });
                      },
                      obscureText: true,
                      obscuringCharacter: "*",
                      decoration: AuthComps.loginfields(
                          isempty: _emptyfields[3],
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
                AuthComps.loginbtn(_loading, "Sign Up", const Color(0xFF36A9E1),
                    () {
                  _attemptValidationandSignUp(authProv, indexProv);
                }),
                sbw(10),
                AuthComps.loginbtn(false, "Login", const Color(0xFF0561AB), () {
                  GoRouter.of(context).go("/profile/login");
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

  void _attemptValidationandSignUp(
      AuthProvider authProv, IndexProvider indexProv) async {
    _isserverauthvalid = false;
    _setchanges();

    if (_tapenabled) {
      _tapenabled = false;
      await AuthandValidateSignUp.authsignup(
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

      _isserverauthvalid
          ? {
              authProv.login(),
              GoRouter.of(context).go("/home"),
              setState(() {
                indexProv.changeindex(0);
                _loading = false;
              })
            }
          : {
              _tapenabled = true,
              setState(() {
                _loading = false;
              })
            };
    }
  }

  void _setchanges() {
    setState(() {
      _emptyfields[0] = _namecont.text.isEmpty;
      _emptyfields[1] = _emailcont.text.isEmpty;
      _emptyfields[2] = _passcont.text.isEmpty;
      _emptyfields[3] = _confrmpass.text.isEmpty;
      _loading = true;
      FocusManager.instance.primaryFocus?.unfocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
