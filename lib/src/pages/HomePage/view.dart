import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginprovider/src/pages/HomePage/Widgets/ProductWidget.dart';
import 'package:loginprovider/src/pages/HomePage/model.dart';
import 'package:loginprovider/src/pages/HomePage/provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<AllProductsModel>(
      create: (context) => AllProductsProvider().getAllProducts(),
      lazy: true,
      initialData: AllProductsModel(products: [], message: true),
      catchError: (context, _) {
        return AllProductsModel(products: [], message: true);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("All Products Page"),
            centerTitle: true,
          ),
          body: Consumer(builder:
              (BuildContext context, AllProductsModel allProductsModel, __) {
            if (allProductsModel == null) {
              return Center(
                  child: CupertinoActivityIndicator(
                animating: true,
                radius: 15,
              ));
            } else if (allProductsModel.products.isEmpty) {
              return Center(child: Text("Empty"));
            } else if (allProductsModel.products == null) {
              return Center(child: Text("Empty"));
            } else {
              return ListView.builder(
                  itemCount: allProductsModel.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AllProductsWidget(
                      product: allProductsModel.products[index],
                      removeFav: () {},
                    );
                  });
            }
          })),
    );
  }
}
