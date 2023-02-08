import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

final indexProvider = StateProvider<int>((ref) => 0);

final pokemonService = Provider<PokemonServices>((ref) => PokemonServices());

final pokemonProvider =
    FutureProvider<List<Pokemon>>((ref) async {
   return ref.read(pokemonService).getAllPokemons();
});
