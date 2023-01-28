
import 'package:flutter/material.dart';

import '../core/entities/shop.dart';

displayAlert(BuildContext context, Shop shops) => showDialog(
  context: context,
  builder: (context) => AlertDialog(
  title: Text(shops.name, textAlign: TextAlign.center,),
  content: const Text('Ponte en contacto con la tienda por uno de los siguientes metodos:'),
  actions: <Widget>[
    TextButton(
      onPressed: () => Navigator.pop(context, 'Cerrar'),
      child: const Text('Cerrar'),
    ),
  ],
),
barrierColor: Colors.black.withOpacity(0.7),
);