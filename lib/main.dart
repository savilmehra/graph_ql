import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'package:graph_ql/routes.dart';

import 'package:graphql_flutter/graphql_flutter.dart';

import 'config/fcm_service.dart';
Future<void> main() async {
  await initHiveForFlutter();




  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAPpState createState() => MyAPpState();
}

class MyAPpState extends State<MyApp> {
  late FcmService fcmService;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initializeFcmService();
    });
    super.initState();
  }

  Future<void> initializeFcmService() async {
    fcmService = FcmService(context);
    await fcmService.initializeFCM();
    fcmService.getFCM();
  }

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
