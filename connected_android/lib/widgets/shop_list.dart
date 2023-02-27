import 'package:connected_android/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import '../services/firebase_service.dart';
/*
class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, value, child) => value.isLoading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
          itemCount: value.products?.length,
          itemBuilder: (context, index) {
            final product = value.products![index];
            return Text(product.name);
          },
        )
      ),
    );
  }
}
*/
///*
class ShopList extends StatelessWidget {
  const ShopList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getStores(),
        builder: ((context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return createShopList(context,
                  snapshot.data?[index]['name'],
                  snapshot.data?[index]['picture'],
                  snapshot.data?[index]['location']
                );
              },
              padding:
              const EdgeInsets.only(bottom: 10, left: 16, right: 16, top: 110),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })
      )
    );
  }
}
//*/