import 'package:flutter_layered/application/pokemon_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/pokemon.dart';

part 'pokemon_notifier.g.dart';

@riverpod
class PokemonNotifier extends _$PokemonNotifier {
  @override
  Future<Pokemon> build() async {
    final pokemon = await ref.read(pokemonServiceProvider).getPokemon(1);
    return pokemon;
  }
}
