import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductGetBuilderController extends GetxController {
  ProductModel productModel =
      ProductModel(name: "pepsi", price: "12000", off: "10%");

  product_setter(String name) {
    productModel = ProductModel(name: name, price: "19000", off: "10%");
    print(productModel.name);
    update();
  }
// late Rx<ProductModel> productModel;

// ProductController({required this.productModel });
  @override
  void onInit() {
    print("initState2");
    super.onInit();
  }

  @override
  void onReady() {
    print("onReady");
    super.onReady();
  }

  @override
  void onClose() {
    print("onClose");
    super.onClose();
  }
}
