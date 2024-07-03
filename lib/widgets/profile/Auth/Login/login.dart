import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';
import 'package:trekkers_pk/utils/utilspack2.dart';
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
  bool _isconnectionlive = false;
  final List<bool> _isfieldempty = [false, false];
  final TextEditingController _emailcont = TextEditingController();
  final TextEditingController _passcont = TextEditingController();
  bool _loading = false;
  bool _tapenabled = true;
  bool _fieldenable = true;
  bool _isemailvalid = false, _ispassvalid = false;
  bool _isserverauthvalid = false;
  late List<ConnectivityResult> connectivityResult;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _initConnectivity();
      },
    );
  }

  Future<void> _initConnectivity() async {
    try {
      connectivityResult = await Connectivity().checkConnectivity();
      // ignore: empty_catches
    } catch (e) {}

    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        connectivityResult = result;
      });
    });
  }

  String getconstring() {
    for (var result in connectivityResult) {
      switch (result) {
        case ConnectivityResult.mobile:
          setState(() {
            _isconnectionlive = true;
          });
          print("::::::: connection mobile ::::::: $_isconnectionlive");
          return "Mobile network available.";
        case ConnectivityResult.wifi:
          setState(() {
            _isconnectionlive = true;
            print("::::::: connection ::::::: $_isconnectionlive");
          });
          return "Wi-Fi is available.";
        case ConnectivityResult.ethernet:
          return "Ethernet connection available.";
        case ConnectivityResult.vpn:
          return "VPN connection active.";
        case ConnectivityResult.bluetooth:
          return "Bluetooth connection available.";
        case ConnectivityResult.other:
          return "Connected to a network which is not in the above mentioned networks.";
        case ConnectivityResult.none:
          _isconnectionlive = false;
          print("no connection :::::::::: $_isconnectionlive");
          // If none is found in the list, return a message
          return "No available network types.";
      }
    }

    return "Unknown connectivity state.";
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
                  style: const TextStyle(fontFamily: "Montserrat"),
                  enabled: _fieldenable,
                  controller: _emailcont,
                  onChanged: (value) {
                    setState(() {
                      _isemailvalid = ValidationUtils.isEmailValid(value);
                    });
                  },
                  decoration: AuthComps.loginfields(
                      isempty: _isfieldempty[0],
                      hint: "Email",
                      icon: Icons.person,
                      isvalid: _isemailvalid)),
            ),
            gapV(10),
            SizedBox(
              height: 48,
              child: TextField(
                enabled: _fieldenable,
                controller: _passcont,
                onChanged: (value) {
                  setState(() {
                    _ispassvalid = ValidationUtils.isPassValid(value);
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
            gapV(20),
            AuthComps.loginbtn(_loading, "Login", const Color(0xFF0561AB),
                () async {
              getconstring();
              _attemptlogin(authProv, indexProv);
            }),
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

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
  }

  void _onValidationResult(bool isValid) {
    setState(() {
      _isserverauthvalid = isValid;
    });
  }

  void _attemptlogin(AuthProvider authProv, IndexProvider indexProv) async {
    _isserverauthvalid = false;
    setState(() {
      _isfieldempty[0] = _emailcont.text.isEmpty;
      _isfieldempty[1] = _passcont.text.isEmpty;
      _loading = true;
      FocusManager.instance.primaryFocus?.unfocus();
    });

    if (_tapenabled) {
      _tapenabled = false;

      _isconnectionlive
          ? {
              await AuthorizeLogin.auth(_emailcont.text, _passcont.text,
                  _onValidationResult, context),
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
                    }
            }
          : {
              ScaffoldMessenger.of(context).showSnackBar(
                  UtilsPack2.snackBar("No Internet Connection", 1)),
              _fieldenable = true,
              _tapenabled = true,
              setState(() {
                _loading = false;
              }),
            };
    }
  }
}
