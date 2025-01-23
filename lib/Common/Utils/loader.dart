import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:taskone/Common/Utils/color.dart';

class Loader extends StatelessWidget {
  final double radius;
  final Color color;
  const Loader({
    super.key,
    this.radius = 40,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitPouringHourGlassRefined(
        color: color,
        size: radius,
      ),
    );
  }
}
