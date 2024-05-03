import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trekkers_pk/profile/profile.dart';
import 'package:trekkers_pk/reusabs/reusabs.dart';

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
  final ImagePicker picker = ImagePicker();
  File? license;
  File? credit;
  List<File>? _images;
  static const String _almost =
      "You’re almost finished with your profile. Add your certificates and licenses to showcase your skills and expertise.";
  bool? ischecked1 = false;
  bool? ischecked2 = false;

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
                          ischecked: ischecked1,
                          onpressed: (nvalue) {
                            setState(() {
                              ischecked1 = nvalue!;
                              ischecked2 = false;
                            });
                          }),
                      const Text("Yes"),
                      CheckBox(
                          ischecked: ischecked2,
                          onpressed: (nvalue) {
                            setState(() {
                              ischecked2 = nvalue!;
                              ischecked1 = false;
                            });
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFF1F1F1),
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(5.0),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _imagepicker1,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0561AB),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          _isuploaded1 ? "Change" : "Upload",
                          style: const TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                      _isuploaded1
                          ? Row(
                              children: [
                                const Text("Uploaded"),
                                sbw(10),
                                const Icon(
                                  Icons.check_box,
                                  color: Color(0xFF66CC00),
                                )
                              ],
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
                sbh(20),
                const Text(
                  "Do you have credibility from any reputable organization for tour conducts?",
                  style: ProfileComps.heading,
                ),
                sbh(10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFFF1F1F1),
                  ),
                  height: 50,
                  padding: const EdgeInsets.all(5.0),
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _imagepicker2,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0561AB),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text(
                          _isuploaded2 ? "Change" : "Upload",
                          style: const TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                      ),
                      _isuploaded2
                          ? Row(
                              children: [
                                const Text("Uploaded"),
                                sbw(10),
                                const Icon(
                                  Icons.check_box,
                                  color: Color(0xFF66CC00),
                                )
                              ],
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
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
                ProfileComps.submitButton(text: "Next", onpressed: () {})
              ],
            ),
          ),
        ));
  }
}
