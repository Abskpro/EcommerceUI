// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as int,
    image: json['image'] as String,
    title: json['title'] as String,
    price: json['price'] as int,
    description: json['description'] as String,
    size: json['size'] as int,
    color: json['color'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'description': instance.description,
      'color': instance.color,
      'price': instance.price,
      'size': instance.size,
      'id': instance.id,
    };
