import 'package:flutter/material.dart';
import 'package:taskone/Common/Utils/dimensions.dart';

class ErrorScreen extends StatelessWidget {
  final String error;
  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    Sizes().init(context);

    return Scaffold(
      body: SizedBox(
        height: Sizes.screenHeight,
        width: Sizes.screenWidth,
        child: Center(
          child: Text(error),
        ),
      ),
    );
  }
}
