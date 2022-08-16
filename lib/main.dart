import 'package:flutter/material.dart';
import 'package:graph_ql/ui/continent_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

Future<void> main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    'https://demo.saleor.io/graphql/',
  );
  ValueNotifier<GraphQLClient> client = ValueNotifier(
        GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())
  )
    
  );

  var app =GraphQLProvider(client: client,child: const MyApp(),);
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const ProductsPage(title: 'Products'),
    );
  }
}

