import 'package:dio/dio.dart';
import 'package:loginprovider/src/helpers/network.dart';
import 'package:loginprovider/src/pages/HomePage/model.dart';

enum ProductsStatus {
  GetAllProductsStart,
  GetAllProductsFailed,
  GetAllProductsSuccess
}

class AllProductsProvider {
  // List<Product> _products = List();
  // ProductsStatus _status;

  // List<Product> get products => _products;
  // ProductsStatus get status => _status;
  AllProductsModel allProductsModel = AllProductsModel();

  NetWork _network = NetWork();

  Future<AllProductsModel> getAllProducts() async {
    print("ok i am here");
    var result = await _network.postData(url: "/allitems",formData: FormData.fromMap({"keyword":"ب"}));

    print("-=-=-=>results => ${result.toString()}");

    if (result['message']) {
      allProductsModel = AllProductsModel.fromJson(result);
      return allProductsModel;
    } else {
      return AllProductsModel(
        products: [],
        message: false,
      );
    }
  }
}
