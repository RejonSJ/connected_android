
import 'package:flutter/material.dart';

import '../core/entities/shop.dart';

displayAlert(BuildContext context, AsyncSnapshot snapshot, int index) => showDialog(
  context: context,
  builder: (context) => AlertDialog(
  title: Text(snapshot.data?[index]['name'], textAlign: TextAlign.center,),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Text('Ponte en contacto con la tienda por uno de los siguientes metodos:'),
      const SizedBox(height: 20),
      if (snapshot.data?[index]['contactMessage']!= null)
        InkWell(
          onTap: () {
            
          },
          child: ListTile(
            title: const Text('Mensaje directo'),
            subtitle: Text(snapshot.data?[index]['contactMessage']),
            leading: const Icon(Icons.phone_outlined),
            trailing: const Icon(Icons.arrow_right),
          ),
        ),
      if (snapshot.data?[index]['contactCall']!= null)
        InkWell(
          onTap: () {
            
          },
          child: ListTile(
            title: const Text('Llamada directa'),
            subtitle: Text(snapshot.data?[index]['contactCall']),
            leading: const Icon(Icons.message_outlined),
            trailing: const Icon(Icons.arrow_right),
          ),
        ),
      if (snapshot.data?[index]['contactWA']!= null)
        InkWell(
          onTap: () {
            
          },
          child: ListTile(
            title: const Text('Whatsapp'),
            subtitle: Text(snapshot.data?[index]['contactWA']),
            leading: const Icon(Icons.phone_android_outlined),
            trailing: const Icon(Icons.arrow_right),
          ),
        ),
    ],
  ),
  actions: <Widget>[
    TextButton(
      onPressed: () => Navigator.pop(context, 'Cerrar'),
      child: const Text('Cerrar'),
    ),
  ],
),
barrierColor: Colors.black.withOpacity(0.7),
);