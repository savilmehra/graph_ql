import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph_ql/bloc/cubits/product_cubit.dart';
import 'package:graph_ql/bloc/states/states.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bloc/states/main_state.dart';
import '../consts/queries/product_quries.dart';
import '../data/products_response.dart';


class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProductCubit>(context)
          .getProducts(query: productGraphQL, channel: 'default-channel', first: 15);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _getBody());
  }

  Widget _getBody() {
    return BlocBuilder<ProductCubit, MainState>(builder: (context, state) {
      if (state is LoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is ErrorState) {
        return const Center(child: Text("Something went wrong"));
      }
      else {
        ProdustsData productData = ProdustsData.fromJson((state as Loaded).data!);

        return GridView.builder(
            itemCount: productData.products!.edges!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 0.75,
                crossAxisCount: 2),
            itemBuilder: (_, index) {
              final item = productData.products!.edges![index];

              return Card(
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      item.node!.thumbnail!.url ?? "",
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.node!.name ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    )
                  ],
                )),
              );
            });
      }
    });
  }
}
