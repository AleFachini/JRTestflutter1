// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) {
  return Entry(
    id: json['id'] as String,
    author: json['author'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'url': instance.url,
    };
