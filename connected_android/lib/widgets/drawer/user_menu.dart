import '../../globals.dart' as globals;
import 'package:flutter/material.dart';

class UserMenu extends StatelessWidget {
  const UserMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 88,
                    width: 88,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const StadiumBorder(),
                      child: Image.asset('images/people/placeholder.png'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout_outlined),
                    onPressed: () {
                      globals.isLoggedIn = false;
                    },
                    style: IconButton.styleFrom(
                      focusColor: Theme.of(context)
                          .colorScheme
                          .onSurfaceVariant
                          .withOpacity(0.12),
                      highlightColor: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.12),
                      side: () {} == null
                          ? BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.12))
                          : BorderSide(
                              color: Theme.of(context).colorScheme.outline),
                    ).copyWith(
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Theme.of(context).colorScheme.onSurface;
                        }
                        return null;
                      }),
                    ),
                  ),
                ],
              ),
              const Text('Bienvenido'),
              const Text('José Roberto García de la Barrera')
            ],
          )),
          const ListTile(
            title: Text('Información básica'),
          ),
          const ListTile(
            leading: Icon(Icons.feed_outlined),
            title: Text('Información de usuario'),
          ),
          const ListTile(
            leading: Icon(Icons.place_outlined),
            title: Text('Ubicación'),
          ),
          const ListTile(
            title: Text('Mi tienda'),
          ),
          const ListTile(
            leading: Icon(Icons.store_outlined),
            title: Text('Información de negocio'),
          ),
        ],
      ),
    );
  }
}
