import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'reusabs.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(),
          const Divider(),
          sbh(18),
          ProfileComp.profiletile('Profile Edit', () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfileEdit()));
          }),
          sbh(12),
          ProfileComp.profiletile('Experience', () {}),
          sbh(12),
          ProfileComp.profiletile('Professional Sport Activities', () {}),
          sbh(12),
          ProfileComp.profiletile('Certificate and License', () {}),
        ]),
      ),
    );
  }
}

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();
  bool isuploaded = false;
  final ImagePicker picker = ImagePicker();
  File? profimagefile;

  Future imagepicker() async {
    final XFile? imageraw = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      profimagefile = File(imageraw!.path);
      isuploaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      extendBodyBehindAppBar: true,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 40, bottom: 12),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Profile Edit',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: EdgeInsets.zero,
                        elevation: 0.0),
                    child: Image.asset(
                      'assets/icons/nexticon.png',
                      fit: BoxFit.fill,
                    ),
                  ))
            ],
          ),
          const Divider(),
          sbh(20),
          const Text(
            'Let’s start with adding your personal details and a profile picture. You can also edit these details later.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          sbh(18),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                height: 100,
                width: 100,
                padding: const EdgeInsets.all(3.0),
                child: ClipOval(
                  child: InkWell(
                    onTap: () {
                      imagepicker();
                    },
                    child: isuploaded
                        ? Image.file(
                            profimagefile!,
                            fit: BoxFit.fill,
                          )
                        : Container(
                            decoration: const BoxDecoration(color: Colors.grey),
                          ),
                  ),
                ),
              ),
              sbw(25),
              const Text(
                'Profile Image Here',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              )
            ],
          ),
          sbh(20),
          const TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              hintText: 'Full Name',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
          sbh(12),
          const TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              hintText: 'Phone Number',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
          sbh(12),
          const TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              hintText: 'Gender',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
