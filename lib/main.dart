import 'package:appname/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BreakingBad(
    app_routes: App_routes(),
  ));
}

class BreakingBad extends StatelessWidget {
  // This widget is the root of your application.
  final App_routes app_routes;

  const BreakingBad({Key? key, required this.app_routes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: app_routes.generateRoute,
    );
  }
}
