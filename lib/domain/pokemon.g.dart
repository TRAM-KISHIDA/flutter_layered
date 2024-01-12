// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      types: const TypesConverter().fromJson(json['types']),
      imageUrl: const ImageUrlConverter().fromJson(json['sprites']),
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'types': const TypesConverter().toJson(instance.types),
      'sprites': const ImageUrlConverter().toJson(instance.imageUrl),
    };
