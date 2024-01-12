import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../presentation/pokemon_notifier.dart';

class PokemonScreen extends HookConsumerWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pokemonNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.valueOrNull?.name ?? 'Loading...'),
      ),
      body: state.when(
        data: (data) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(data.imageUrl),
                const SizedBox(height: 16),
                Column(
                  children: List.generate(
                    data.types.length,
                    (index) => Text(data.types[index]),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
