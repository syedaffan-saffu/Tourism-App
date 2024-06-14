import 'package:isar/isar.dart';
part 'profileeditdb.g.dart';

@collection
class Profileeditdb {
  Id id = Isar.autoIncrement;
  String? img;
  String? name;
  String? phone;
  // String? gender;
  // String? langs;
  // String? prof;
}
