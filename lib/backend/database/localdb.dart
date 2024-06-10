import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDb {
  static Future<Isar> opendb(List<CollectionSchema> schema) async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(schema, directory: dir.path);
  }
}
