import 'package:flutter/material.dart';

import '../services/firebase_service.dart';
import '../widgets/product_card.dart';

class ProductSearchPage extends StatelessWidget {
  final String search;
  const ProductSearchPage ({ Key? key, required this.search }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar producto'),
      ),
      body: FutureBuilder(
        future: getProductsByName(search),
        builder: ((context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return createProductList(context,snapshot,index);
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
      // Center(
      //   child: 
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(Icons.search_off, size: 150, color: Theme.of(context).colorScheme.onSurfaceVariant,),
      //       const Text('No se encontró ningún resultado'),
      //       OutlinedButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         child: const Text('Regresar'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
