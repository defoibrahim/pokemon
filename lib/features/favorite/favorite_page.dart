import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemony/models/pokemon.dart';

import '../../providers/favorite_provider.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(favoriteProvider);
    final isLoading = ref.watch(isLoadingProductsProvider);
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : data.isEmpty
              ? const Center(child: Text('No items, please Add Some'))
              : ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return FavoriteBody(
                      data[index],
                    );
                  },
                ),
    );
  }
}

class FavoriteBody extends StatefulWidget {
  const FavoriteBody(this.data, {super.key});
  final Pokemon data;

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(widget.data.getImageUrl),
      title: Text(widget.data.name ?? ''),
      trailing: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return IconButton(
            icon: const Icon(
              Icons.delete_forever_outlined,
            ),
            onPressed: () {
              setState(() {
                ref
                    .watch(favoriteProvider.notifier)
                    .removeFavorite(widget.data);
              });
            },
          );
        },
      ),
    );
  }
}
