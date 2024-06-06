import 'package:isar/isar.dart';
part 'clientdb.g.dart';

@collection
class Client {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  String? email;
}
