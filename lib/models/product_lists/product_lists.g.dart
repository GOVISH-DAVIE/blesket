// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductLists _$$_ProductListsFromJson(Map<String, dynamic> json) =>
    _$_ProductLists(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductListsToJson(_$_ProductLists instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
