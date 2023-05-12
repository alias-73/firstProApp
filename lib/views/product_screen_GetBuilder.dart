// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/product_controller.dart';
import '../controllers/product_getBuilderController.dart';
import '../models/product_model.dart';

class ProductScreenGetBuilder extends StatelessWidget {
  // final ProductController _productController = Get.put(ProductController( productModel: ProductModel(name: "Milk", price: "175000", off: "12%").obs)); /// در GetX دیگه بهش نیاز نیست

// value is for RX classes just 😎
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProductScreenGetBuilder"),
      ),
      body: Center(
          child: GetBuilder<ProductGetBuilderController>(
              initState: (state) => print("initState"),
              init: ProductGetBuilderController(),
              autoRemove: true,
              dispose: (state) {
                state.dispose();
              },
              builder:
                  (ProductGetBuilderController productGetBuilderController) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "pro name: ${productGetBuilderController.productModel.name}",
                      // "pro name: ${_productModel.value.name}",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "pro price: ${productGetBuilderController.productModel.price}",
                      // "pro price: ${_productModel.value.price}",
                      style: TextStyle(fontSize: 30),
                    ),
                    Text(
                      "pro off: ${productGetBuilderController.productModel.off}",
                      // "pro off: ${_productModel.value.off}",
                      style: TextStyle(fontSize: 30),
                    ),
                    ElevatedButton(
                        child: Text("change content"),
                        onPressed: () {
                          Get.find<ProductGetBuilderController>()
                              .product_setter("IceCream");
                          // .productModel
                          // .update((val) {
                          // val!.name = "Pasta";
                          // val.price = "12300";
                          // val.off = "50%";
                          // });
                        }),
                    ElevatedButton(
                        child: Text("Delete Controller !"),
                        onPressed: () {
                          Get.delete<ProductGetBuilderController>();
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
