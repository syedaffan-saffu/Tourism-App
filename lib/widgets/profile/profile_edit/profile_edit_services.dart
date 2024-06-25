import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:trekkers_pk/backend/database/localdb.dart';
import 'package:trekkers_pk/backend/provider/providers.dart';
import '../../../backend/database/profiledb/profileeditdb.dart';

class ProfileEditServices {
  Future<void> initDb(BuildContext context) async {
    final isarprov = Provider.of<IsarProvider>(context, listen: false);
    if (isarprov.isar == null) {
      final isar = await IsarDb.opendb([ProfileeditdbSchema]);
      isarprov.isarUpdate(isar);
    }
    // print(":::::::::::::::::::isar:::::::::::::::: $isar");
  }

  Future<File?> readPicDb(BuildContext context) async {
    final isarprov = Provider.of<IsarProvider>(context, listen: false);
    await initDb(context);
    Profileeditdb? existingData = await isarprov.isar!.profileeditdbs.get(1);
    if (existingData != null) {
      return File(existingData.img!);
    }

    return null;
  }

  Future<Map<String, String?>> readDb(BuildContext context) async {
    await initDb(context);
    final isarprov = Provider.of<IsarProvider>(context, listen: false);
    Profileeditdb? existingData = await isarprov.isar!.profileeditdbs.get(1);
    if (existingData != null) {
      return {
        'name': existingData.name,
        'phone': existingData.phone,
      };
    }

    return {
      'name': null,
      'phone': null,
    };
  }

  Future<void> writeDb(
      String img, String name, String num, BuildContext context) async {
    await initDb(context);
    final isarprov = Provider.of<IsarProvider>(context, listen: false);

    final data = Profileeditdb()
      ..id = 1
      ..img = img
      ..name = name
      ..phone = num;
    await isarprov.isar!.writeTxn(() async {
      await isarprov.isar!.profileeditdbs.put(data);
    });
  }

  Future<void> deleteDb(BuildContext context) async {
    final isarprov = Provider.of<IsarProvider>(context, listen: false);
    final data = await readDb(context);
    if (data.values.first != null) {
      await isarprov.isar!.writeTxn(() async {
        await isarprov.isar!.profileeditdbs.delete(1);
      });
    }
  }

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageRaw = await picker.pickImage(source: ImageSource.gallery);
    if (imageRaw != null) {
      return File(imageRaw.path);
    }
    return null;
  }

  Future<bool> closedb(BuildContext context) async {
    final isarprov = Provider.of<IsarProvider>(context, listen: false);
    if (isarprov.isar!.isOpen) {
      return await isarprov.isar!.close();
    } else {
      return true;
    }
  }
}
