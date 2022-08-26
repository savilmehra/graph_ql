

import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'config/graphql/repository_graphql.dart';

LocatorMain locator() => LocatorMain();

Logger logger() => LocatorMain().logger;

class LocatorMain implements Locator {
  LocatorMain._();

  factory LocatorMain() {
    Locator.init(LocatorMain._());
    return Locator.getInstance();
  }
  @override
  Connectivity connectivity = AlwaysOnlineConnectivity();
  @override
  Logger logger = ConsoleLogger(LogLevel.nothing);
  RepositoryGraphql repository = RepositoryGraphql();

  void dispose() => Locator.dispose();
}
