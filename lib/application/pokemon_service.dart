import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/pokemon.dart';
import '../repository/pokemon_api_repository.dart';

part 'pokemon_service.g.dart';

@riverpod
PokemonService pokemonService(PokemonServiceRef ref) {
  return PokemonService(ref);
}

class PokemonService {
  PokemonService(this.ref);
  final Ref ref;

  Future<Pokemon> getPokemon(int id) async {
    final pokemonApiRepository = ref.read(pokemonApiRepositoryProvider);
    final pokemon = await pokemonApiRepository.getPokemon(id);
    return pokemon;
  }
}
