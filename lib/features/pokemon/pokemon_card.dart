import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokemony/providers/bucket_provider.dart';
import 'package:pokemony/providers/favorite_provider.dart';

import '../../models/pokemon.dart';
import '../../providers/image_color_provider.dart';

class PokemonCard extends ConsumerWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.onTap,
  });

  final Pokemon pokemon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageProvider = ref.watch(imageColorProvider(pokemon.getImageUrl));
    return imageProvider.maybeWhen(
      data: (paletteGenerator) => PokemonCardView(
        onTap: onTap,
        pokemon: pokemon,
        paletteGenerator: paletteGenerator,
      ),
      orElse: () => PokemonCardView(
        onTap: onTap,
        pokemon: pokemon,
      ),
    );
  }
}

class PokemonCardView extends StatefulWidget {
  const PokemonCardView({
    super.key,
    required this.onTap,
    required this.pokemon,
    this.paletteGenerator,
  });

  final Pokemon pokemon;
  final PaletteGenerator? paletteGenerator;
  final VoidCallback onTap;

  @override
  State<PokemonCardView> createState() => _PokemonCardViewState();
}

class _PokemonCardViewState extends State<PokemonCardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      color: widget.paletteGenerator?.dominantColor?.color ??
          const Color(0xFFB8DFCA),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.network(widget.pokemon.getImageUrl),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  widget.pokemon.name!,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                Text(
                  '#0${widget.pokemon.id}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: widget.paletteGenerator?.colors.last,
                      ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 2,
            top: 2,
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                final bool isExist = ref
                    .watch(favoriteProvider.notifier)
                    .checkFavorite(widget.pokemon);
                return isExist
                    ? IconButton(
                        icon: const Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            ref
                                .watch(favoriteProvider.notifier)
                                .removeFavorite(widget.pokemon);
                          });
                        },
                      )
                    : IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.red),
                        onPressed: () {
                          setState(() {
                            ref
                                .watch(favoriteProvider.notifier)
                                .addFavorite(widget.pokemon);
                          });
                        },
                      );
              },
            ),
          ),
          Positioned(
            left: 2,
            top: 2,
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return IconButton(
                  icon: const Icon(Icons.add_shopping_cart_sharp,),
                  onPressed: () {
                    setState(() {
                      ref
                          .watch(bucketProvider.notifier)
                          .addBucket(widget.pokemon);
                    });
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
