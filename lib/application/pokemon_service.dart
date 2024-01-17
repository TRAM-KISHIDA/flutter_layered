import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/pokemon.dart';
import '../repository/pokemon_repository.dart';

part 'pokemon_service.g.dart';

@riverpod
PokemonService pokemonService(PokemonServiceRef ref) {
  return PokemonService(ref);
}

class PokemonService {
  PokemonService(this.ref);
  final Ref ref;

  Future<Pokemon> getPokemon({required int id}) async {
    try {
      final pokemonRepository = ref.read(pokemonRepositoryProvider);
      final pokemon = await pokemonRepository.getPokemon(id: id);
      return pokemon;
    } catch (error) {
      throw error.toString();
    }
  }
}
