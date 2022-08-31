import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/prefrences.dart';
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
                icon: Icon(Icons.add_shopping_cart_outlined)),

            const DropDownWidget()
          ],
          title: const Text("Products"),
        ),
        body:viewModel.data.products==null|| viewModel.data.products!.items == null ||
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
                        Flexible(
                          child: CachedNetworkImage(
                            imageUrl: item.thumbnail!.url ?? "",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
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

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String dropdownValue = 'Memory';

  @override
  void initState() {
    getPrefs();
    super.initState();
  }

  getPrefs()
  async {

    setState(() {
      dropdownValue= SharedPrefs.instance.getString("cache")??"Memory";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down_rounded,color: Colors.white,),
        elevation: 16,
        style: const TextStyle(color: Colors.white),

        onChanged: (String? newValue) {
          setState(()  {
            dropdownValue = newValue!;
            SharedPrefs.instance.setString("cache", newValue);
          });
        },
        items: <String>['Hive','Memory']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value, style: const TextStyle(color: Colors.black87)),
          );
        }).toList(),
      ),
    );
  }
}
