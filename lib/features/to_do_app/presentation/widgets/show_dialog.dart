import 'package:flutter/material.dart';
import 'package:to_do_app/features/to_do_app/presentation/widgets/simple_button.dart';
import 'package:to_do_app/features/to_do_app/presentation/widgets/simple_input.dart';

import '../design/floating_pane.dart';
import '../design/responsive.dart';
import '../design/text_styles.dart';

class DialogWidget extends StatelessWidget {
  final VoidCallback addButton;
  final VoidCallback cancelButton;
  final TextEditingController titleController;
  final TextEditingController definitionController;

  const DialogWidget({
    Key? key,
    required this.addButton,
    required this.cancelButton,
    required this.titleController,
    required this.definitionController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive().init(context);
    return FloatingPane(
      width: getWidth(320.0),
      height: getHeight(450.0),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Add new task", style: TextStyles.titleFont),
            SimpleInput(
              title: "Title",
              controller: titleController,
            ),
            SimpleInput(
              title: "Definition",
              controller: definitionController,
              maxline: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SimpleButton.standard(
                    width: getWidth(110.0),
                    text: "Cancel",
                    onPressed: cancelButton),
                SimpleButton.showDialogOk(
                  width: getWidth(110.0),
                  text: "Add",
                  onPressed: addButton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
