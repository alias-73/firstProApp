// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/product_controller.dart';
import '../models/product_model.dart';

class ProductScreen2 extends StatelessWidget {
  // final ProductController _productController = Get.put(ProductController( productModel: ProductModel(name: "Milk", price: "175000", off: "12%").obs));
  final ProductController _productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "pro name: ${_productController.productModel.value.name}",
                // "pro name: ${_productModel.value.name}",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "pro price: ${_productController.productModel.value.price}",
                // "pro price: ${_productModel.value.price}",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "pro off: ${_productController.productModel.value.off}",
                // "pro off: ${_productModel.value.off}",
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                  child: Text("change content"),
                  onPressed: () {
                    _productController.productModel.update((val) {
                      val!.name = "product updated";
                    });

                    // _productModel.update((val) {
                    //   val!.name = "CHIPS";
                    //   val.price = "17000\$";
                    //   val.off = "5%";
                    // });
                  }),
              ElevatedButton(
                  child: Text("go back !"),
                  onPressed: () {
                    Get.back();
                  }),
            ],
          );
        }),
      ),
    );
  }
}
