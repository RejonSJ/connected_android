import 'package:meta/meta.dart';
import 'dart:convert';

StoreResponseDto storeResponseDtoFromJson(String str) => StoreResponseDto.fromJson(json.decode(str));

String storeResponseDtoToJson(StoreResponseDto data) => json.encode(data.toJson());

class StoreResponseDto {
    StoreResponseDto({
        required this.id,
        required this.name,
        required this.location,
        required this.picture,
        required this.contactCall,
        required this.contactMessage,
        required this.contactWA,
    });

    final int id;
    final String name;
    final String location;
    final String picture;
    final String contactCall;
    final String contactMessage;
    final String contactWA;

    factory StoreResponseDto.fromJson(Map<String, dynamic> json) => StoreResponseDto(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        picture: json["picture"],
        contactCall: json["contactCall"],
        contactMessage: json["contactMessage"],
        contactWA: json["contactWA"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "picture": picture,
        "contactCall": contactCall,
        "contactMessage": contactMessage,
        "contactWA": contactWA
    };
}
