// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductList _$$_ProductListFromJson(Map<String, dynamic> json) =>
    _$_ProductList(
      id: json['id'] as int?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      productName: json['product_name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      isbn: json['isbn'] as String?,
      price: json['price'] as int?,
      images: json['images'] as String?,
      stock: json['stock'] as int?,
      isAvailable: json['is_available'] as bool?,
      category: json['category'] as int?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      modifiedDate: json['modified_date'] == null
          ? null
          : DateTime.parse(json['modified_date'] as String),
    );

Map<String, dynamic> _$$_ProductListToJson(_$_ProductList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner': instance.owner,
      'product_name': instance.productName,
      'slug': instance.slug,
      'description': instance.description,
      'isbn': instance.isbn,
      'price': instance.price,
      'images': instance.images,
      'stock': instance.stock,
      'is_available': instance.isAvailable,
      'category': instance.category,
      'created_date': instance.createdDate?.toIso8601String(),
      'modified_date': instance.modifiedDate?.toIso8601String(),
    };
