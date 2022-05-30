import 'package:hive/hive.dart';
import 'package:to_do_app/features/to_do_app/domain/models/to_do_model.dart';

class Boxes {
  static Box<ToDo> getToDo() => Hive.box<ToDo>("to_do_list");
}
