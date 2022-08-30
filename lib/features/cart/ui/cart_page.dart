import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../routes.dart';
import '../model/cart_vm.dart';

class CartPage extends Screen {
  final CartViewModel viewModel;

  CartPage({required this.viewModel});

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
                icon: Icon(Icons.add))

          ],
          title: const Text("Cart Items"),
        ),
        body:  viewModel.data.cart==null || viewModel.data.cart!.items == null ||
                viewModel.data.cart!.items!.isEmpty
            ? const Center(
                child: Text("No data found!!"),
              )
            : ListView.builder(
                itemCount: viewModel.data.cart!.items!.length,
                itemBuilder: (_, index) {
                  final item = viewModel.data.cart!.items![index];

                  return Card(
                    child: Center(
                        child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: CachedNetworkImage(
                            imageUrl: item.product!.image!.url ?? "",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  item.quantity.toString() ,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),

                                Text(
                                item.product!.name ?? "",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),



                              ],
                            )

                          ),
                        )
                      ],
                    )),
                  );
                }));
  }
}
