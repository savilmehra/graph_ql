import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../routes.dart';
import '../model/product_vm.dart';

class HomePage extends Screen {
  final ProductViewModel viewModel;

  HomePage({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEEEEEE),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.router.push(Routes.get);
                },
                icon: Icon(Icons.accessibility_sharp))
,
            IconButton(
                onPressed: () {
                  context.router.push(Routes.cart);
                },
                icon: Icon(Icons.add_shopping_cart_outlined))
          ],
          title: const Text("Products"),
        ),
        body: viewModel.data.products!.items == null ||
                viewModel.data.products!.items!.isEmpty
            ? const Center(
                child: Text("No data found!!"),
              )
            : GridView.builder(
                itemCount: viewModel.data.products!.items!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 2.0,
                    crossAxisSpacing: 2.0,
                    childAspectRatio: 0.75,
                    crossAxisCount: 2),
                itemBuilder: (_, index) {
                  final item = viewModel.data.products!.items![index];

                  return Card(
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: item.thumbnail!.url ?? "",
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.name ?? "",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        )
                      ],
                    )),
                  );
                }));
  }
}
