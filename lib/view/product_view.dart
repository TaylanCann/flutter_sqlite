import 'package:flutter/material.dart';
import 'package:flutter_sqlite/view_model/product_vm.dart';
import 'package:provider/provider.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: context.watch<ProductViewModel>().state == ProductState.BUSY
            ? buildLoadingWidget()
            : context.watch<ProductViewModel>().state == ProductState.ERROR
                ? buildErrorWidget()
                : buildListView(context));
  }

  _appBar() {
    return AppBar();
  }

  Center buildErrorWidget() => Center(child: Text('Something went wrong!'));

  Center buildLoadingWidget() => Center(child: CircularProgressIndicator());

  ListView buildListView(BuildContext context) {
    return ListView.builder(
        itemBuilder: (_, index) => buildListItem(context, index));
  }

  Widget buildListItem(BuildContext context, int index) {
    final product = context.read<ProductViewModel>().products[index];
    return Card(
      child: ListTile(
        title: Text(product.name.toString()),
      ),
    );
  }
}
