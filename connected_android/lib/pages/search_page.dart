import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final String searchType;
  const SearchPage ({ Key? key, required this.searchType }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar $searchType'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 150, color: Theme.of(context).colorScheme.onSurfaceVariant,),
            const Text('No se encontró ningún resultado'),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Regresar'),
            ),
          ],
        ),
      ),
    );
  }
}
