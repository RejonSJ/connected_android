import 'package:connected_android/widgets/shop_contact.dart';
import 'package:flutter/material.dart';

import '../core/entities/shop.dart';

createShopList(BuildContext context, Shop shops) => InkWell(
  onTap:() => displayAlert(context, shops),
  child: Card(
    semanticContainer: true,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: BorderSide(
        color: Theme.of(context).colorScheme.outlineVariant,
        width: 1,
      ),
    ),
    child: SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 140,
            width: 400,
            child: Image.asset(shops.profilePic, fit: BoxFit.cover,
            )
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(shops.name, style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface),),
                  Text(shops.address, style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);