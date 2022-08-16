import 'dart:convert';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/products_response.dart';


const countriesQL = """{
  products(first: 15, channel: "default-channel") {
    edges {
      node {
        id
        name
        description
        thumbnail{url}
      }
    }
  }
}""";

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  final JsonDecoder _decoder = new JsonDecoder();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: // ...
            Query(
          options: QueryOptions(
            document: gql(countriesQL),
          ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (result.data == null) {
              return const Text('No data found');
            }


            ProdustsData produstsData = ProdustsData.fromJson(result.data!);



            if (
                produstsData.products == null ||
                produstsData.products!.edges == null) {
              return const Text('No data found');
            }
            return GridView.builder(
                itemCount:produstsData.products!.edges!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                    childAspectRatio: 0.75,
                    crossAxisCount: 2),
                itemBuilder: (_, index) {
                  final item =produstsData.products!.edges![index];

                  return Card(
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          item.node!.thumbnail!.url??"",
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.node!.name??"",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    )),
                  );
                });
          },
        ));
  }
}
