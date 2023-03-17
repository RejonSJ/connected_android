import 'package:connected_android/pages/product_search_page.dart';
import 'package:flutter/material.dart';

import '../../../pages/shop_search_page.dart';

class StoreSearchBar extends StatefulWidget {
  const StoreSearchBar({Key? key}) : super(key: key);
  @override
  State<StoreSearchBar> createState() => _StoreSearchBarState();
}

class _StoreSearchBarState extends State<StoreSearchBar> {
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
                          builder: (context) => StoreSearchPage(
                                search: searchController.text
                              )),
                    ),
                    cursorColor: Theme.of(context).colorScheme.onSurfaceVariant,
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                      hintText: 'Buscar Tienda',
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
