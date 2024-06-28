import 'package:flutter/material.dart';

import '../../../utils/utilspack1.dart';
import 'authcomps.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({super.key});

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final TextEditingController _emailcont = TextEditingController();
  bool _isempty = false;
  bool _tapenabled = true;
  bool _verloading = false;
  bool _fieldenable = true;
  bool _isemailvalid = false;
  bool _sent = false;

  Future _simulateVerification() async {
    setState(() {
      _isempty = _emailcont.text.isEmpty;
    });
    if (_isemailvalid) {
      setState(() {
        _tapenabled = false;
        _verloading = true;
        _fieldenable = false;
        _isempty = _emailcont.text.isEmpty;
      });
      await Future.delayed(const Duration(seconds: 4));
      setState(() {
        _verloading = false;
        _sent = true;
        _tapenabled = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Email is not Valid"),
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            gapV(50),
            Center(
              child: SizedBox(
                height: 60,
                child: Image.asset('assets/images/logon.png'),
              ),
            ),
            gapV(15),
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
                gapV(50),
                const Text(
                  "Wellcome to the Team!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            gapV(13),
            const Text(
              "Digitize your tour guide career by becoming a part of the team. Sign up with your email and set a password to get started with your profile!",
              style: TextStyle(
                fontSize: 17,
                color: Color(0xFF999999),
              ),
            ),
            gapV(20),
            SizedBox(
              height: 48,
              child: TextField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  enabled: _fieldenable,
                  controller: _emailcont,
                  onChanged: (value) {
                    setState(() {
                      _isemailvalid = ValidationUtils.isEmailValid(value);
                    });
                  },
                  decoration: AuthComps.loginfields(
                      hint: "Email",
                      icon: Icons.email,
                      isempty: _isempty,
                      isvalid: _isemailvalid)),
            ),
            gapV(20),
            _sent
                ? Text(
                    "Verification Link has been sent to ${_emailcont.text}. Plz Check your Email")
                : AuthComps.loginbtn(
                    _verloading,
                    "Verify Email",
                    _tapenabled
                        ? const Color(0xFF36A9E1)
                        : const Color(0xAA46B9F1),
                    _tapenabled ? _simulateVerification : () {}),
            gapV(30),
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
}
