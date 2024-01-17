import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../domain/pokemon.dart';

part 'pokemon_api_client.g.dart';

@RestApi(baseUrl: '/api/v2/pokemon')
abstract class PokemonApiClient {
  factory PokemonApiClient(Dio dio, {String baseUrl}) = _PokemonApiClient;

  @GET("/{id}")
  Future<Pokemon> getPokemon(@Path("id") int id);
}
