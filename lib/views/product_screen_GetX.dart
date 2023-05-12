// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/product_controller.dart';
import '../models/product_model.dart';

class ProductScreenGetX extends StatelessWidget {
  // final ProductController _productController = Get.put(ProductController( productModel: ProductModel(name: "Milk", price: "175000", off: "12%").obs)); /// در GetX دیگه بهش نیاز نیست

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: GetX(
            autoRemove: true,
              dispose: (state) {
                state.dispose();
              },
              init: ProductController(),
              builder: (ProductController productController) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "pro name: ${productController.productModel.value.name}",
                      // "pro name: ${_productModel.value.name}",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "pro price: ${productController.productModel.value.price}",
                      // "pro price: ${_productModel.value.price}",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "pro off: ${productController.productModel.value.off}",
                      // "pro off: ${_productModel.value.off}",
                      style: TextStyle(fontSize: 30),
                    ),
                    ElevatedButton(
                        child: Text("change content"),
                        onPressed: () {
                          Get.find<ProductController>()
                              .productModel
                              .update((val) {
                            val!.name = "Pasta";
                            val.price = "12300";
                            val.off = "50%";
                          });
                        }),
                    ElevatedButton(
                        child: Text("go back !"),
                        onPressed: () {
                          Get.back();
                        }),
                  ],
                );
              })),
    );
  }
}
