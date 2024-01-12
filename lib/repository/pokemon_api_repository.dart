import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/pokemon.dart';
import '../repository/api_helper.dart';

part 'pokemon_api_repository.g.dart';

@riverpod
PokemonApiRepository pokemonApiRepository(PokemonApiRepositoryRef ref) {
  return PokemonApiRepository(ApiHelper.dio);
}

@RestApi(baseUrl: '/api/v2/pokemon')
abstract class PokemonApiRepository {
  factory PokemonApiRepository(Dio dio, {String baseUrl}) =
      _PokemonApiRepository;

  @GET("/{id}")
  Future<Pokemon> getPokemon(@Path("id") int id);
}
