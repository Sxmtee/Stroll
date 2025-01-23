import 'package:flutter/material.dart';
import 'package:taskone/Common/Widgets/error_screen.dart';
import 'package:taskone/Common/Widgets/page_router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    default:
      return pageRouter(
        child: const Scaffold(
          body: ErrorScreen(
            error: "This Page Does Not Exist",
          ),
        ),
      );
  }
}
