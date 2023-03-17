import 'package:connected_android/pages/shop_page.dart';
import 'package:flutter/material.dart';

createProductList(BuildContext context, AsyncSnapshot snapshot, int index) => Card(
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
      onTap:() => {
  
      Navigator.push(context,MaterialPageRoute(builder: (context) => ShopPage(storeName: snapshot.data?[index]['store'],))),
  
    },
    child: SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data?[index]['name'], style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurface), overflow: TextOverflow.ellipsis,),
                      Text(snapshot.data?[index]['store'], style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurfaceVariant, overflow: TextOverflow.ellipsis)),
                      const SizedBox(height: 8,),
                      Text(snapshot.data?[index]['description'], style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.onSurface, overflow: TextOverflow.ellipsis),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('images/product/${snapshot.data?[index]['image']}.jpg', fit: BoxFit.cover,)
          ),
        ],
      ),
    ),
  ),
);