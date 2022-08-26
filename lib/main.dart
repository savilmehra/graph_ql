import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'package:graph_ql/routes.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
Future<void> main() async {
  await initHiveForFlutter();




  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CFRouterScope(
      initialRoute: Routes.home,
      routeGenerator: Routes.generate,
      builder: (context) {
        return MaterialApp.router(
          routeInformationParser: const CFRouteInformationParser(),
          routerDelegate: CFRouterDelegate(context),
        );
      },
    );
  }
}
