import 'package:flutter/material.dart';
import 'package:pokemony/features/pokemon/pokemon_card.dart';

import '../../core/animations/slide_animation.dart';
import '../../models/pokemon.dart';

class PokemonCardGridView extends StatelessWidget {
  const PokemonCardGridView({super.key, required this.data});
  final List<Pokemon>? data;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      key: ValueKey('__list_${data}__'),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.65,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: data?.length,
        (BuildContext context, int index) {
          final pokemon = data![index];
          return SlideAmination(
            isEven: index.isEven,
            child: PokemonCard(
              onTap: () {},
              pokemon: pokemon,
            ),
          );
        },
      ),
    );
  }
}
