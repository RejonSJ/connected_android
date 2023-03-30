import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

displayAlert(BuildContext context, AsyncSnapshot snapshot, int index) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          snapshot.data?[index]['name'],
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
                'Ponte en contacto con la tienda por uno de los siguientes metodos:'),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                  var location = snapshot.data?[index]['location'];
                  var message = Uri.parse('https://www.google.com/maps/search/?api=1&query=$location"');
                  launchUrl(message);
                },
              child: ListTile(
                title: const Text('Dirección'),
                subtitle: Text(snapshot.data?[index]['location']),
                leading: const Icon(Icons.place_outlined),
                trailing: const Icon(Icons.arrow_right),
              ),
            ),
            if (snapshot.data?[index]['contactMessage'] != null)
              InkWell(
                onTap: () {
                  var number = snapshot.data?[index]['contactMessage'];
                  var message = Uri.parse('sms:$number');
                  launchUrl(message);
                },
                child: ListTile(
                  title: const Text('Mensaje directo'),
                  subtitle: Text(snapshot.data?[index]['contactMessage']),
                  leading: const Icon(Icons.message_outlined),
                  trailing: const Icon(Icons.arrow_right),
                ),
              ),
            if (snapshot.data?[index]['contactCall'] != null)
              InkWell(
                onTap: () {
                  var number = '+52${snapshot.data?[index]['contactCall']}';
                  var call = Uri.parse('tel:$number');
                  launchUrl(call);
                },
                child: ListTile(
                  title: const Text('Llamada directa'),
                  subtitle: Text(snapshot.data?[index]['contactCall']),
                  leading: const Icon(Icons.phone_outlined),
                  trailing: const Icon(Icons.arrow_right),
                ),
              ),
            if (snapshot.data?[index]['contactWA'] != null)
              InkWell(
                onTap: () async {
                  var whatsapp = '+52${snapshot.data?[index]['contactWA']}';
                  var whatsappAndroid = Uri.parse("whatsapp://send?phone=$whatsapp");
                  launchUrl(whatsappAndroid);
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
