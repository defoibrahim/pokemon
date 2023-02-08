import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
       appBar: AppBar(
          title: const Text('favorite'),
          centerTitle: true,
          actions: [
          ],
        ),
        body: const Center(child: Text('favorite')),
    );
  }
}