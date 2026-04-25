import 'package:isar/isar.dart';

// this line is needed to generate file
// then run dart run build_runner build
part 'note.g.dart';

// MODEL (M in MVC)
// Represents the Note data structure stored in the local Isar database
@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}