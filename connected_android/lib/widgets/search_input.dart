import 'package:connected_android/color_schemes.g.dart';
import 'package:connected_android/pages/search_page.dart';
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final String searchType;
  const SearchInput({Key? key, required this.searchType}) : super(key: key);
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25, left: 16, right: 16),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Card(
                  color: lightColorScheme.surface,
                  elevation: 3,
                  surfaceTintColor: lightColorScheme.surfaceTint,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)),
                  child: TextField(
                    onSubmitted: (value) => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchPage(
                                searchType: widget.searchType,
                              )),
                    ),
                    cursorColor: lightColorScheme.onSurfaceVariant,
                    decoration: InputDecoration(
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      hintText: 'Buscar ${widget.searchType}',
                      hintStyle: TextStyle(
                          color: lightColorScheme.onSurfaceVariant,
                          fontSize: 16),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(15),
                        width: 18,
                        child: const Icon(Icons.menu),
                      ),
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
