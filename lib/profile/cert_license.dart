import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trekkers_pk/profile/profile.dart';
import 'package:trekkers_pk/utils/reusabs.dart';

import 'profile_comps.dart';

class CertandLicense extends StatefulWidget {
  const CertandLicense({super.key});

  @override
  State<CertandLicense> createState() => _CertandLicenseState();
}

class _CertandLicenseState extends State<CertandLicense> {
  bool _isuploaded1 = false;
  bool _isuploaded2 = false;
  bool _isuploaded3 = false;
  bool _checkedeither = false;
  final ImagePicker picker = ImagePicker();
  File? license;
  File? credit;
  List<File>? _images;
  static const String _almost =
      "You’re almost finished with your profile. Add your certificates and licenses to showcase your skills and expertise.";
  bool _ischeckedyes = false;
  bool _ischeckedno = false;

  Future _imagepicker1() async {
    final XFile? imageraw = await picker.pickImage(source: ImageSource.gallery);
    if (imageraw != null) {
      setState(() {
        license = File(imageraw.path);
        _isuploaded1 = true;
      });
    } else {
      setState(() {
        _isuploaded1 = false;
      });
    }
  }

  Future _imagepicker2() async {
    final XFile? imageraw = await picker.pickImage(source: ImageSource.gallery);
    if (imageraw != null) {
      setState(() {
        credit = File(imageraw.path);
        _isuploaded2 = true;
      });
    } else {
      setState(() {
        _isuploaded2 = false;
      });
    }
  }

  Future _multipicker() async {
    final List<XFile> imagesraw = await picker.pickMultiImage();
    if (imagesraw.isNotEmpty) {
      setState(() {
        _images = imagesraw.map((xfile) => File(xfile.path)).toList();
        _isuploaded3 = true;
      });
    } else {
      setState(() {
        _isuploaded3 = false;
      });
    }
  }

  void _validation() {
    if (!_checkedeither || !_isuploaded1 || !_isuploaded2 || !_isuploaded3) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Not all fields are filled!'),
      ));
    } else {
      () {};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ProfileComps.appBar("Certificate and License"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(_almost, style: ProfileComps.heading),
                sbh(20),
                const Text(
                  "Are you a certified tour Guide",
                  style: ProfileComps.heading,
                ),
                SizedBox(
                  width: contextwidth(context) * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CheckBox(
                          ischecked: _ischeckedyes,
                          onpressed: (nvalue) {
                            setState(() {
                              _ischeckedyes = nvalue!;
                              _ischeckedno = false;
                            });
                            _ischeckedyes
                                ? _checkedeither = true
                                : _checkedeither = false;
                          }),
                      const Text("Yes"),
                      CheckBox(
                          ischecked: _ischeckedno,
                          onpressed: (nvalue) {
                            setState(() {
                              _ischeckedno = nvalue!;
                              _ischeckedyes = false;
                            });
                            _ischeckedno
                                ? _checkedeither = true
                                : _checkedeither = false;
                          }),
                      const Text("No"),
                    ],
                  ),
                ),
                sbh(10),
                const Text(
                  "Do you have a license from regional or national authorities?",
                  style: ProfileComps.heading,
                ),
                sbh(10),
                ProfileComps2.licandcert(
                    isuploaded: _isuploaded1, onpresssed: _imagepicker1),
                sbh(20),
                const Text(
                  "Do you have credibility from any reputable organization for tour conducts?",
                  style: ProfileComps.heading,
                ),
                sbh(10),
                ProfileComps2.licandcert(
                    isuploaded: _isuploaded2, onpresssed: _imagepicker2),
                sbh(15),
                Text(
                  "Testimonials of Successful Tours(Add Pictures)",
                  style: ProfileComps.heading.copyWith(height: 1.5),
                ),
                const Text(
                  "If you have been a part of successful tours, please upload the pictures here.",
                  style: ProfileComps.hintstyle,
                ),
                sbh(20),
                InkWell(
                  onTap: _multipicker,
                  child: Container(
                      height: 100,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFBFBFB),
                          border: Border.all(color: const Color(0xFFEAEAEA)),
                          borderRadius: BorderRadius.circular(5)),
                      child: _isuploaded3 && _images != null
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _images!.length,
                              itemBuilder: (context, index) {
                                return Image.file(_images![index]);
                              })
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.photo,
                                  size: 26,
                                  color: Color(0xFFC0C0C0),
                                ),
                                Text("Add Photos"),
                              ],
                            )),
                ),
                sbh(20),
                ProfileComps.submitButton(text: "Next", onpressed: _validation)
              ],
            ),
          ),
        ));
  }
}
