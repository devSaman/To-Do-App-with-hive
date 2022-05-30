import 'package:hive/hive.dart';

part "to_do_model.g.dart";

@HiveType(typeId: 0)
class ToDo extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late DateTime completionTime;

  @HiveField(3)
  late bool isDone;
}
