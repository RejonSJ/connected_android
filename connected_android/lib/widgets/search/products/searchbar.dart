import 'package:connected_android/pages/product_search_page.dart';
import 'package:flutter/material.dart';

class ProductSearchBar extends StatefulWidget {
  const ProductSearchBar({Key? key}) : super(key: key);
  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Card(
                  color: Theme.of(context).colorScheme.surface,
                  elevation: 3,
                  surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: TextField(
                    controller: searchController,
                    onSubmitted: (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductSearchPage(
                                search: searchController.text
                              )),
                    ),
                    cursorColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      hintText: 'Buscar Producto',
                      hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontSize: 16),
                      suffixIcon: const SizedBox(
                        width: 18,
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
