import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonPage extends ConsumerWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const Center(child: Text('pokemon')),
    );
  }
}
