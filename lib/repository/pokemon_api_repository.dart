import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/pokemon.dart';

part 'pokemon_api_repository.g.dart';

@riverpod
PokemonApiRepository pokemonApiRepository(PokemonApiRepositoryRef ref) {
  final dio = Dio();
  return PokemonApiRepository(dio);
}

@RestApi(baseUrl: "https://pokeapi.co/api/v2")
abstract class PokemonApiRepository {
  factory PokemonApiRepository(Dio dio, {String baseUrl}) =
      _PokemonApiRepository;

  @GET("/pokemon/{id}")
  Future<Pokemon> getPokemon(@Path("id") int id);
}
