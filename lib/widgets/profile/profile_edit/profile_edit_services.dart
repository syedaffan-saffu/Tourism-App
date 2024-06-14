import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:isar/isar.dart';
import 'package:trekkers_pk/backend/database/localdb.dart';
import '../../../backend/database/profiledb/profileeditdb.dart';

class ProfileEditServices {
  Isar? isar;

  Future<void> initDb() async {
    // print(":::::::::::::::::::isar:::::::::::::::: $isar");
    isar ??= await IsarDb.opendb([ProfileeditdbSchema]);
  }

  Future<File?> readPicDb() async {
    await initDb();
    Profileeditdb? existingData = await isar!.profileeditdbs.get(1);
    if (existingData != null) {
      return File(existingData.img!);
    }
    return null;
  }

  Future<Map<String, String?>> readDb() async {
    await initDb();
    Profileeditdb? existingData = await isar!.profileeditdbs.get(1);
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

  Future<void> writeDb(String img, String name, String num) async {
    await initDb();
    final data = Profileeditdb()
      ..id = 1
      ..img = img
      ..name = name
      ..phone = num;
    await isar!.writeTxn(() async {
      await isar!.profileeditdbs.put(data);
    });
  }

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageRaw = await picker.pickImage(source: ImageSource.gallery);
    if (imageRaw != null) {
      return File(imageRaw.path);
    }
    return null;
  }

  Future<bool> closedb() async {
    return await isar!.close();
  }
}
