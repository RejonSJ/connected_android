import 'package:connected_android/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class UserMenu extends StatelessWidget {
  final User user;
  const UserMenu ({ Key? key, required this.user }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          //padding: EdgeInsets.zero,
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
                      child: SvgPicture.asset(
                          'images/logo/logo.svg',
                          colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.onBackground, BlendMode.srcIn),
                        ),
                    ),
                  ],
                ),
                const Text('Sesión iniciada con:'),
                Text(user.email!)
              ],
            )),
            // const ListTile(
            //   title: Text('Información básica'),
            // ),
            // const ListTile(
            //   leading: Icon(Icons.feed_outlined),
            //   title: Text('Información de usuario'),
            // ),
            // const ListTile(
            //   leading: Icon(Icons.place_outlined),
            //   title: Text('Ubicación'),
            // ),
            // const ListTile(
            //   title: Text('Mi tienda'),
            // ),
            // const ListTile(
            //   leading: Icon(Icons.store_outlined),
            //   title: Text('Información de negocio'),
            // ),
            FilledButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Text('Cerrar sesión'))
          ],
        ),
      ),
    );
  }
}
