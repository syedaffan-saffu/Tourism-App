import 'package:flutter/material.dart';
import '../../reusabs/reusabs.dart';
import 'package:flutter_svg/svg.dart';

class SignInUpComps {
  static InputDecoration loginfields(
      {required String hint, required IconData icon, required bool isvalid}) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color(0xFFAAAAAA),
      ),
      suffixIcon: isvalid
          ? Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                "assets/icons/checks.svg",
              ),
            )
          : null,
      suffixIconConstraints: BoxConstraints.tight(const Size.square(30)),
      fillColor: const Color.fromARGB(255, 255, 250, 250),
      filled: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      hintText: hint,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEAEAEA))),
    );
  }

  static ElevatedButton loginbtn(
      bool isloading, String text, Color color, void Function() onpressed) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: color),
      child: isloading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                color: Color(0xFFFFFFFF),
              ),
            )
          : Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
    );
  }

  static ElevatedButton socialbtn(
      String text, IconData icon, Color color, void Function() onpressed) {
    return ElevatedButton(
      onPressed: onpressed,
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          sbw(5),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
