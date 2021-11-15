import 'package:flutter/material.dart';
import 'package:flutter_sqlite/database/db_helper.dart';
import 'package:flutter_sqlite/model/product_model.dart';
import 'package:flutter_sqlite/view/product_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  DbHelper helper = DbHelper();
  Product product = Product();

  @override
  Widget build(BuildContext context) {
    product.name = "asd";
    product.amount = 1;
    product.barcode = "asdasd";
    product.explanation = "123123123";
    helper.insertProduct(product);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: ProductView(),
    );
  }
}
