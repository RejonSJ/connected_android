import '../core/entities/product.dart';

class ProductRepository {
  static List<Product> getProduct() => List.generate(
    6,
    (index) => Product(
      id: index + 1,
      name: 'Panadería ${index + 1}',
      productPic: 'images/product/${index + 1}.jpg',
      description: 'Placeholder description',
      storeId: 1
    ),
  );
}
