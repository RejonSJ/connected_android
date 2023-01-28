import '../core/entities/shop.dart';

class ShopRepository {
  static List<Shop> getShop() => List.generate(
        6,
        (index) => Shop(
            id: index + 1,
            name: 'Panadería ${index + 1}',
            profilePic: 'images/shop/placeholder/${index + 1}.jpg',
            address: 'Placeholder location'),
      );
}
