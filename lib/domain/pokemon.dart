import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
// part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    required int id,
    required String name,
    required List<String> types,
    required String imageUrl,
  }) = _Pokemon;

  // factory Pokemon.fromJson(Map<String, dynamic> json) =>
  //     _$PokemonFromJson(json);

  // TODO: @KeyJsonなりを使って実現する
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<String> typesToList(dynamic types) {
      List<String> ret = [];
      for (int i = 0; i < types.length; i++) {
        ret.add(types[i]['type']['name']);
      }
      return ret;
    }

    return Pokemon(
      id: json['id'],
      name: json['name'],
      types: typesToList(json['types']),
      imageUrl: json['sprites']['other']['official-artwork']['front_default'],
    );
  }
}
