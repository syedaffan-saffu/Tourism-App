import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trekkers_pk/profile/profile.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: SizedBox(
                height: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            const Center(
              child: Text(
                "TREKKERS.PK",
                style: TextStyle(
                    fontFamily: "Orbitron",
                    fontSize: 25,
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
            sbh(15),
            const Text(
              "Digitize your tour guide career by becoming a part of the team. Sign up with your email and set a password to get started with your profile!",
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFFAAAAAA),
              ),
            ),
            sbh(20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Color(0xFFAAAAAA),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    "assets/icons/checks.svg",
                  ),
                ),
                suffixIconConstraints: BoxConstraints.tight(Size.square(30)),
                fillColor: const Color.fromARGB(255, 250, 250, 250),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                hintText: "Email",
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 203, 203, 203))),
              ),
            ),
            sbh(20),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.key,
                  color: Color(0xFFAAAAAA),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    "assets/icons/checks.svg",
                  ),
                ),
                suffixIconConstraints: BoxConstraints.tight(Size.square(30)),
                fillColor: const Color.fromARGB(255, 250, 250, 250),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                hintText: "Password",
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 203, 203, 203))),
              ),
            ),
            sbh(20),
            TextField(
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.key,
                  color: Color(0xFFAAAAAA),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    "assets/icons/checks.svg",
                  ),
                ),
                suffixIconConstraints: BoxConstraints.tight(Size.square(30)),
                fillColor: const Color.fromARGB(255, 250, 250, 250),
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                hintText: "Confirm Password",
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 203, 203, 203))),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
