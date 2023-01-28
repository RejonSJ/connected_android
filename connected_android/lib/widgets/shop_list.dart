import 'package:connected_android/data/shop_repository.dart';
import 'package:flutter/material.dart';
import 'shop_card.dart';

class ShopList extends StatelessWidget {
  const ShopList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var shops = ShopRepository.getShop();
    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) =>
              createShopList(context, shops[index]),
          separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
          padding: const EdgeInsets.only(
            bottom: 10,
            left: 16,
            right: 16,
            top: 110
          ),
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}

