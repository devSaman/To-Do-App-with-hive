import 'package:flutter/material.dart';

import '../design/colors.dart';
import '../design/text_styles.dart';

class SimpleInput extends StatelessWidget {
  final String title;
  final String? errorText;
  final int? maxline;
  final bool isObscure;
  final int? maxLength;
  final TextEditingController controller;
  final TextInputType inputType;
  final Function(String)? onChanged;

  const SimpleInput(
      {Key? key,
      required this.title,
      required this.controller,
      this.onChanged,
      this.maxline,
      this.errorText,
      this.maxLength,
      this.isObscure = false,
      this.inputType = TextInputType.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.inputTitleFont,
        ),
        const SizedBox(
          height: 6.0,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.68,
          child: TextField(
            controller: controller,
            cursorColor: Palette.primary,
            style: TextStyles.inputFont,
            maxLines: maxline,
            obscureText: isObscure,
            keyboardType: inputType,
            maxLength: maxLength ?? 256,
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Palette.grey,
              counterText: '',
              contentPadding: const EdgeInsets.all(12.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide.none),
              errorText: errorText,
            ),
          ),
        ),
        const SizedBox(
          height: 8.0,
        )
      ],
    );
  }
}
