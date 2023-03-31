import 'package:flutter/material.dart';

import '../services/firebase_service.dart';
import '../widgets/shop_card.dart';

class StoreSearchPage extends StatelessWidget {
  final String search;
  const StoreSearchPage ({ Key? key, required this.search }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar tienda'),
      ),
      body: FutureBuilder(
        future: getStoresByName(search),
        builder: ((context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return createShopList(context, snapshot, index);
              },
              padding:
              const EdgeInsets.only(bottom: 10, left: 16, right: 16, top: 10),
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
