import 'package:flutter/material.dart';
import 'package:taskone/Common/Utils/color.dart';
import 'package:taskone/Common/Utils/dimensions.dart';
import 'package:taskone/Common/Widgets/text.dart';

class AppDialogs extends StatelessWidget {
  final String titleText;
  final String contentText;
  final String commandText;
  final Color? commandColor;
  final VoidCallback commandPress;
  const AppDialogs({
    super.key,
    required this.titleText,
    required this.contentText,
    required this.commandText,
    required this.commandPress,
    this.commandColor,
  });

  @override
  Widget build(BuildContext context) {
    Sizes().init(context);

    return AlertDialog.adaptive(
      title: Texts(
        text: titleText,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      content: Texts(text: contentText),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Texts(
            text: "Cancel",
            color: AppColors.primaryColor,
          ),
        ),
        TextButton(
          onPressed: commandPress,
          child: Texts(
            text: commandText,
            color: commandColor,
          ),
        ),
      ],
    );
  }
}
