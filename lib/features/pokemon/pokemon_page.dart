import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemony/features/pokemon/pokemon_card_grid_view.dart';
import 'package:pokemony/providers/pokemon_provider.dart';

class PokemonPage extends ConsumerWidget {
  PokemonPage({super.key});
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(pokemonProvider);
    return Scaffold(
      body: data.when(
        data: (data) {
          return CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(
                  20,
                  20,
                  20,
                  MediaQuery.of(context).padding.bottom,
                ),
                sliver: PokemonCardGridView(data: data),
              ),
            ],
          );
        },
        error: (error, stackTrace) => const Text('Error'),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
