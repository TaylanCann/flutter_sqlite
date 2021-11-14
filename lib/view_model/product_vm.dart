import 'package:flutter/cupertino.dart';
import 'package:flutter_sqlite/database/db_helper.dart';
import 'package:flutter_sqlite/model/product_model.dart';

enum ProductState { IDLE, BUSY, ERROR }

class ProductViewModel with ChangeNotifier {
  late ProductState _state;
  late List<Product> products;

  ProductViewModel() {
    products = [];
    _state = ProductState.IDLE;
  }

  ProductState get state => _state;

  set state(ProductState state) {
    _state = state;
    notifyListeners();
  }

  Future<List<Product>> fetchProducts() async {
    try {
      state = ProductState.BUSY;
      products = await DbHelper().getItemsProducts();
      state = ProductState.IDLE;
      return products;
    } catch (e) {
      state = ProductState.ERROR;
      return [];
    }
  }
}
