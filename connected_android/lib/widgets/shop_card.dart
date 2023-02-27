import 'package:flutter/material.dart';

createShopList(BuildContext context, String name, String picture, String location) => InkWell(
  //onTap:() => displayAlert(context, shops),
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
            width: double.infinity,
            child: Image.asset('images/shop/placeholder/$picture.jpg', fit: BoxFit.cover,
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
                  Text(name, style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface),),
                  Text(location, style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);