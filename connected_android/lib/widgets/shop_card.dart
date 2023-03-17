import 'package:connected_android/widgets/shop_contact.dart';
import 'package:flutter/material.dart';

createShopList(BuildContext context, AsyncSnapshot snapshot, int index) => Card(
  semanticContainer: true,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12),
    side: BorderSide(
      color: Theme.of(context).colorScheme.outlineVariant,
      width: 1,
    ),
  ),
  child: InkWell(
      onTap:() => displayAlert(context, snapshot, index),
    child: SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: Image.asset('images/shop/placeholder/${snapshot.data?[index]['picture']}.jpg', fit: BoxFit.cover,
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
                  Text(snapshot.data?[index]['name'], style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface),),
                  Text(snapshot.data?[index]['location'], style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ),
);