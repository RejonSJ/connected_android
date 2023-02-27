import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connected_android/dtos/responses/product_response_dtos.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
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
  List products = [];
  CollectionReference collectionReferenceProducts = db.collection('product');

  QuerySnapshot queryProducts = await collectionReferenceProducts.get();

  queryProducts.docs.forEach((document) {
    products.add(document.data());
  });
  return products;
}

Future<List> getStores() async {
  List products = [];
  CollectionReference collectionReferenceProducts = db.collection('product');

  QuerySnapshot queryProducts = await collectionReferenceProducts.get();

  queryProducts.docs.forEach((document) {
    products.add(document.data());
  });
  return products;
}
//*/