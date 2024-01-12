import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    @TypesConverter() required List<String> types,
    @ImageUrlConverter() @JsonKey(name: "sprites") required String imageUrl,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

class TypesConverter implements JsonConverter<List<String>, dynamic> {
  const TypesConverter();

  @override
  List<String> fromJson(dynamic json) {
    List<String> ret = [];
    for (int i = 0; i < json.length; i++) {
      ret.add(json[i]['type']['name']);
    }
    return ret;
  }

  @override
  dynamic toJson(List<String> types) {
    return types; // 適当
  }
}

class ImageUrlConverter implements JsonConverter<String, dynamic> {
  const ImageUrlConverter();

  @override
  String fromJson(dynamic json) {
    return json['other']['official-artwork']['front_default'];
  }

  @override
  dynamic toJson(String imageUrl) {
    return imageUrl; // 適当
  }
}
