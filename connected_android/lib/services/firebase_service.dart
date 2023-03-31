import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connected_android/dtos/responses/product_response_dtos.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

/*
class ProductProvider extends ChangeNotifier {
  List<ProductResponseDto>? _products;

  bool isLoading = true;

  List<ProductResponseDto>? get products => _products;

  Future getProducts() async {
    db.collection("product").get().then(
      (res) {
        final List<dynamic> data = res.docs;
        _products = data
            .map((product) => ProductResponseDto.fromJson(product))
            .toList();
        isLoading = false;
        notifyListeners();
      },
      onError: (e) => throw Exception('Failed to load products'),
    );
  }
}
*/
///*
Future<List> getProducts() async {
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  List products = [];
  var collectionReferenceProducts = db.collection('product').orderBy('expirationDate').limit(10);

  QuerySnapshot queryProducts = await collectionReferenceProducts.get();

  queryProducts.docs.forEach((document) {
    products.add(document.data());
  });
  return products;
}

Future<List> getProductsByName(String search) async {
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  List products = [];
  Query collectionReferenceProducts = db.collection('product')
  .where("name", isGreaterThanOrEqualTo: search)
  .where("name", isLessThanOrEqualTo: "$search\uf7ff");

  QuerySnapshot queryProducts = await collectionReferenceProducts.get();

  queryProducts.docs.forEach((document) {
    products.add(document.data());
  });
  return products;
}

Future<List> getProductsByStore(String storeName) async {
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  List products = [];
  Query collectionReferenceProducts = db.collection('product')
  .where("store", isGreaterThanOrEqualTo: storeName)
  .where("store", isLessThanOrEqualTo: "$storeName\uf7ff");

  QuerySnapshot queryProducts = await collectionReferenceProducts.get();

  queryProducts.docs.forEach((document) {
    products.add(document.data());
  });
  return products;
}

Future<List> getStores() async {
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  List stores = [];
  var collectionReferenceStores = db.collection('store').limit(10);

  QuerySnapshot queryStores = await collectionReferenceStores.get();

  queryStores.docs.forEach((document) {
    stores.add(document.data());
  });
  return stores;
}

Future<List> getStoresByName(String search) async {
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  List stores = [];
  Query collectionReferenceProducts = db.collection('store')
  .where("name", isGreaterThanOrEqualTo: search)
  .where("name", isLessThanOrEqualTo: "$search\uf7ff");

  QuerySnapshot queryStores = await collectionReferenceProducts.get();

  queryStores.docs.forEach((document) {
    stores.add(document.data());
  });
  return stores;
}

Future<List> getProductStore(String storeName) async {
  await Firebase.initializeApp();
  FirebaseFirestore db = FirebaseFirestore.instance;
  List stores = [];
  Query collectionReferenceProducts = db.collection('store')
  .where("name", isGreaterThanOrEqualTo: storeName)
  .where("name", isLessThanOrEqualTo: "$storeName\uf7ff");

  QuerySnapshot queryStores = await collectionReferenceProducts.get();

  queryStores.docs.forEach((document) {
    stores.add(document.data());
  });
  return stores;
}


//*/