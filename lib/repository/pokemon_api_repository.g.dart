// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_api_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _PokemonApiRepository implements PokemonApiRepository {
  _PokemonApiRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= '/api/v2/pokemon';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Pokemon> getPokemon(int id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>>(_setStreamType<Pokemon>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = Pokemon.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pokemonApiRepositoryHash() =>
    r'fa191b54780f210c8dcc60837f490ac89013deb8';

/// See also [pokemonApiRepository].
@ProviderFor(pokemonApiRepository)
final pokemonApiRepositoryProvider =
    AutoDisposeProvider<PokemonApiRepository>.internal(
  pokemonApiRepository,
  name: r'pokemonApiRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$pokemonApiRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PokemonApiRepositoryRef = AutoDisposeProviderRef<PokemonApiRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
