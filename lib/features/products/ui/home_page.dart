import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/country_vm.dart';


class HomePage extends Screen {
  final CountryVm viewModel;


  HomePage({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      viewModel.data.products!.edges==null || viewModel.data.products!.edges!.isEmpty?
          const Center(
            child: Text("No data found!!"),
          ):
      GridView.builder(
          itemCount: viewModel.data.products!.edges!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 0.75,
              crossAxisCount: 2),
          itemBuilder: (_, index) {
            final item = viewModel.data.products!.edges![index];

            return Card(
              child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      CachedNetworkImage(
                        imageUrl: item.node!.thumbnail!.url ?? "",
                        placeholder: (context, url) => const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => const Icon(Icons.error),
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
          })
    );
  }


}
