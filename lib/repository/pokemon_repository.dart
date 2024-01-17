import 'package:dio/dio.dart';
import 'package:flutter_layered/repository/api/api_helper.dart';
import 'package:flutter_layered/utility/exception/custom_exception.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api/pokemon_api_client.dart';
import '../domain/pokemon.dart';

part 'pokemon_repository.g.dart';

@riverpod
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) {
  return PokemonRepository(ref);
}

class PokemonRepository {
  PokemonRepository(this.ref);
  final Ref ref;
  final client = PokemonApiClient(ApiHelper.dio);

  Future<Pokemon> getPokemon({required int id}) async {
    try {
      final pokemon = await client.getPokemon(id);
      return pokemon;
    } on DioException catch (error) {
      final response = error.response;
      final statusCode = response?.statusCode;

      // ステータスコードに応じてエラーを返す
      switch (statusCode) {
        case 400:
          throw CustomException(response?.data, 400);
        case 401:
          throw CustomException("Unauthorized", 401);
        case 403:
          throw CustomException("Forbidden", 403);
        case 404:
          throw CustomException("Pokemon not found", 404);
        default:
          throw Exception("Something went wrong");
      }
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
