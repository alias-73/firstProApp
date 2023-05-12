import 'package:flutter/material.dart';
import 'package:flutter_professional_app/controllers/product_controller.dart';
import 'package:flutter_professional_app/gen/assets.gen.dart';
import 'package:flutter_professional_app/models/product_model.dart';
import 'package:flutter_professional_app/views/product_screen2.dart';
import 'package:flutter_professional_app/views/product_screen_GetBuilder.dart';
import 'package:flutter_professional_app/views/product_screen_GetX.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  // var counter = 0.obs;
  // RxInt counter = 0.obs;
  // var counter = RxInt(5);
  var counter = Rx<int>(1);
  // var pro = Rx<ProductModel>;

  // ProductController _productController = Get.put(ProductController( productModel: ProductModel(name: "Chocolate", price: "45000", off: "20%").obs));
  ProductController _productController = Get.put(ProductController());
  RxBool status = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      val!.name = "chocho";
                      val.price = "150000";
                      val.off = "15%";
                    });

                    // _productModel.update((val) {
                    //   val!.name = "CHIPS";
                    //   val.price = "17000\$";
                    //   val.off = "5%";
                    // });
                  }),
              ElevatedButton(
                  child: const Text("go next page"),
                  onPressed: () {
                    // Get.testMode = true;
                    // Get.to(ProductScreen2());
                    Get.to(() => ProductScreen2());
                  }),              
                  
                  ElevatedButton(
                  child: const Text("go to GetX page"),
                  onPressed: () {
                    // Get.testMode = true;
                    // Get.to(ProductScreen2());
                    Get.to(() => ProductScreenGetX());
                  }),                  
                  ElevatedButton(
                  child: const Text("go to GetBuilder page"),
                  onPressed: () {
                    // Get.testMode = true;
                    // Get.to(ProductScreen2());
                    Get.to(() => ProductScreenGetBuilder());
                  }),
              ElevatedButton(
                  child: const Text("change Icon"),
                  onPressed: () {
                    status.isFalse ? status.value = true : status.value = false;
                  }),
              status.isFalse
                  ? Icon(Icons.access_alarm)
                  : Icon(Icons.accessibility_new_rounded),
            ],
          );
        }),
      ),
    );
  }
}
