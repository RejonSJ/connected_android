import 'package:connected_android/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopPage extends StatelessWidget {
  final String storeName;
  const ShopPage ({ Key? key, required this.storeName }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Page'),
      ),
      body: FutureBuilder(
        future: getProductStore(storeName),
        builder: ((context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Image.asset('images/shop/placeholder/${snapshot.data?[index]['picture']}.jpg', fit: BoxFit.cover,),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data?[index]['name'], style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSurface),),
                            Text(snapshot.data?[index]['location'], style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.onSurfaceVariant)),
                          ],
                        ),
                      ),
                    ),
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
                      onTap: () async {
                        var whatsapp = snapshot.data?[index]['contactWA'];
                            var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp");
                            if (await canLaunchUrl(whatsappAndroid)) {
                                await launchUrl(whatsappAndroid);
                            } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("WhatsApp is not installed on the device"),
                                ),
                              );
                            }
                      },
                      child: ListTile(
                        title: const Text('Whatsapp'),
                        subtitle: Text(snapshot.data?[index]['contactWA']),
                        leading: const Icon(Icons.phone_android_outlined),
                        trailing: const Icon(Icons.arrow_right),
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
        
      //   },
      //   child: const Icon(Icons.phone),
      // ),
    );
  }
}
