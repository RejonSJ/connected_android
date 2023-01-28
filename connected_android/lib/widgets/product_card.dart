import 'package:flutter/material.dart';

import '../color_schemes.g.dart';
import '../core/entities/product.dart';
import '../core/entities/shop.dart';

createProductList(BuildContext context, Shop shops, Product products) => InkWell(
  //onTap:() => ,
  child: Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: lightColorScheme.outlineVariant,
        width: 1,
      ),
    ),
    child: SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(products.name, style: TextStyle(fontSize: 20, color: lightColorScheme.onSurface),),
                  Text(shops.name, style: TextStyle(fontSize: 12, color: lightColorScheme.onSurfaceVariant)),
                  Text(products.description, style: TextStyle(fontSize: 14, color: lightColorScheme.onSurface),),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset(products.productPic, fit: BoxFit.cover,)
          ),
        ],
      ),
    ),
  ),
);