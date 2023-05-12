import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductController extends GetxController {
  Rx<ProductModel> productModel =
      ProductModel(name: "pepsi", price: "12000", off: "10%").obs;
// late Rx<ProductModel> productModel;

// ProductController({required this.productModel });

}
