import 'package:connected_android/data/product_repository.dart';
import 'package:connected_android/data/shop_repository.dart';
import 'package:connected_android/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var shops = ShopRepository.getShop();
    var products = ProductRepository.getProduct();
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) =>
              createProductList(context, shops[products[index].storeId], products[index]),
          separatorBuilder: (BuildContext context, int index) => const Divider(
            color: Colors.transparent,
          ),
          padding:
              const EdgeInsets.only(bottom: 10, left: 16, right: 16, top: 110),
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
