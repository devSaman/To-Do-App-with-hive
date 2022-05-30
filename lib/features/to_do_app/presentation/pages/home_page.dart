import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/features/to_do_app/data/boxes/boxes.dart';
import 'package:to_do_app/features/to_do_app/presentation/design/colors.dart';
import 'package:to_do_app/features/to_do_app/presentation/design/responsive.dart';
import 'package:to_do_app/features/to_do_app/presentation/widgets/show_dialog.dart';
import 'package:to_do_app/features/to_do_app/presentation/widgets/simple_button.dart';
import 'package:to_do_app/features/to_do_app/presentation/widgets/simple_input.dart';
import '../../domain/models/to_do_model.dart';
import 'package:flutter_toastr/flutter_toastr.dart';

import '../design/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController definitionController = TextEditingController();
  bool _isDone = false;

  @override
  void dispose() {
    Hive.box('to_do_list').close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder<Box<ToDo>>(
          valueListenable: Boxes.getToDo().listenable(),
          builder: (context, box, _) {
            final toDoList = box.values.toList().cast<ToDo>();
            return buildContent(toDoList);
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.green,
          child: const Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => DialogWidget(
                  addButton: () {
                    if (titleController.text.isEmpty) {
                      FlutterToastr.show("Title is empty", context,
                          textStyle: TextStyles.buttonTextFont,
                          duration: FlutterToastr.lengthShort,
                          position: FlutterToastr.top,
                          backgroundColor: Palette.secondary);
                      return;
                    }
                    if (definitionController.text.isEmpty) {
                      FlutterToastr.show(
                        "Definition is empty",
                        context,
                        textStyle: TextStyles.buttonTextFont,
                        duration: FlutterToastr.lengthShort,
                        position: FlutterToastr.top,
                        backgroundColor: Palette.secondary,
                      );
                      return;
                    }
                    addTask(titleController.text, definitionController.text,
                        DateTime.now(), false);
                    Navigator.pop(context);
                    titleController.clear();
                    definitionController.clear();
                  },
                  cancelButton: () {
                    Navigator.pop(context);
                    titleController.clear();
                    definitionController.clear();
                  },
                  titleController: titleController,
                  definitionController: definitionController),
            );
          },
        ),
      ),
    );
  }

  Widget buildContent(List<ToDo> tasks) {
    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("No tasks\nPlease add some tasks",
                textAlign: TextAlign.center, style: TextStyles.titleFont),
            SimpleInput(title: "Title", controller: titleController),
            SimpleInput(title: "Description", controller: definitionController),
            SimpleButton.showDialogOk(
              width: getWidth(110.0),
              text: "Add",
              onPressed: () {
                if (titleController.text.isEmpty) {
                  FlutterToastr.show("Title is empty", context,
                      textStyle: TextStyles.buttonTextFont,
                      duration: FlutterToastr.lengthShort,
                      position: FlutterToastr.top,
                      backgroundColor: Palette.secondary);
                  return;
                }
                if (definitionController.text.isEmpty) {
                  FlutterToastr.show(
                    "Definition is empty",
                    context,
                    textStyle: TextStyles.buttonTextFont,
                    duration: FlutterToastr.lengthShort,
                    position: FlutterToastr.top,
                    backgroundColor: Palette.secondary,
                  );
                  return;
                }
                addTask(titleController.text, definitionController.text,
                    DateTime.now(), false);
                titleController.clear();
                definitionController.clear();
              },
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          const SizedBox(height: 24),
          Text(
            "You have to complete ${tasks.length} tasks",
            style: TextStyles.titleFont,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return buildToDoList(context, task);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildToDoList(context, task) {
    final title = task.title;
    final description = task.description;
    var isDone = task.isDone;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: _isDone ? Palette.green : Palette.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          onTap: () =>
              Navigator.pushNamed(context, '/detail_page', arguments: task),
          title: Text(
            title,
            style: TextStyles.buttonTextFont,
          ),
          subtitle: description.length > 35
              ? Text(
                  description.substring(0, 35) + '...',
                  style: TextStyles.subtitleFont,
                )
              : Text(description, style: TextStyles.subtitleFont),
          trailing: Checkbox(
            activeColor: Palette.secondary,
            value: isDone,
            onChanged: (bool? value) {
              setState(
                () {
                  isDone = value!;
                  isDone != isDone;
                },
              );
            },
          ),
        ),
      ),
    );
  }



  Future addTask(String title, String description, DateTime completionTime,
      bool isDone) async {
    final task = ToDo()
      ..title = title
      ..description = description
      ..completionTime = completionTime
      ..isDone = isDone;

    setState(() {
      final box = Boxes.getToDo();
      box.add(task);
    });

    // box.put("mykey1", task);
  }

 
}
