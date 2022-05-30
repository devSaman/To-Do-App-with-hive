import 'package:flutter/material.dart';
import 'package:to_do_app/features/to_do_app/presentation/design/responsive.dart';
import 'package:to_do_app/features/to_do_app/presentation/widgets/simple_button.dart';

import '../../domain/models/to_do_model.dart';
import '../design/text_styles.dart';
import '../widgets/simple_input.dart';

class DetailPage extends StatefulWidget {
  ToDo task;
  DetailPage({Key? key, required this.task}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final titleController = TextEditingController();
  final definitionController = TextEditingController();
  var isDone;
  @override
  void initState() {
    super.initState();

    final task = widget.task;

    titleController.text = task.title;
    definitionController.text = task.description;
    isDone = task.isDone;
  }

  @override
  void dispose() {
    titleController.dispose();
    definitionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Edit Task",
              textAlign: TextAlign.center, style: TextStyles.titleFont),
          SimpleInput(title: "Title", controller: titleController),
          SimpleInput(
            title: "Description",
            controller: definitionController,
            maxline: 5,
          ),
          buildButtons(context, widget.task),
        ],
      ),
    );
  }

  Widget buildButtons(context, task) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SimpleButton.standard(
              width: getWidth(110.0),
              text: "Delete",
              onPressed: () => deleteTask(task)),
          SimpleButton.showDialogOk(
            text: "Save",
            onPressed: () =>
                editTask(task, titleController.text, definitionController.text),
          ),
        ],
      );

  void editTask(
    ToDo task,
    String title,
    String description,
  ) {
    task.title = title;
    task.description = description;

    task.save();
    Navigator.pop(context);
  }

  void deleteTask(task) {
    task.delete();
    Navigator.pop(context);
  }
}
