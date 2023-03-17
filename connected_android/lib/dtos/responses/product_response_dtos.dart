import 'package:meta/meta.dart';
import 'dart:convert';

ProductResponseDto productResponseDtoFromJson(String str) => ProductResponseDto.fromJson(json.decode(str));

String productResponseDtoToJson(ProductResponseDto data) => json.encode(data.toJson());

class ProductResponseDto {
    ProductResponseDto({
        required this.id,
        required this.name,
        required this.description,
        required this.store,
        required this.image,
    });

    final int id;
    final String name;
    final String description;
    final String store;
    final String image;

    factory ProductResponseDto.fromJson(Map<String, dynamic> json) => ProductResponseDto(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        store: json["store"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "store": store,
        "image": image,
    };
}
