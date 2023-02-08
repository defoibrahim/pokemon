import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pokemony/providers/pokemon_provider.dart';

import '../core/values/constants.dart';
import '../models/pokemon.dart';

final isLoadingProductsProvider = StateProvider<bool>((ref) {
  return true;
});

final favoriteProvider =
    StateNotifierProvider<ProductsNotifier, List<Pokemon>>((ref) {
  return ProductsNotifier(ref: ref);
});

class ProductsNotifier extends StateNotifier<List<Pokemon>> {
  ProductsNotifier({required this.ref}) : super([]) {
    fetchProducts(ref: ref);
  }
  final Ref ref;
  List<Pokemon> favoriteList = [];
  addFavorite(Pokemon val) {
    favoriteList.add(val);
    final mapItems = favoriteList.map((e) => e.toJson()).toList();
    CommonVariables.userData.write(USER_DATA, mapItems);
  }

  removeFavorite(Pokemon val) {
    favoriteList.removeWhere((element) => element.name == val.name);
    state = favoriteList;
  }

  bool checkFavorite(Pokemon val) {
    final result = state.any((element) => element == val);
    return result;
  }

  Future fetchProducts({required Ref ref}) async {
    final mapItems = CommonVariables.userData.read(USER_DATA) ?? [];
    if (mapItems is List) {
      List<dynamic> items = mapItems;
      favoriteList = items
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList();
    } else {
      favoriteList = [];
    }
    if (favoriteList.isNotEmpty) {
      state = favoriteList;
    }
    Future.delayed(const Duration(seconds: 1)).then((value) {
      ref.read(isLoadingProductsProvider.notifier).state = false;
    });
  }

  void toggleFavourite(String name, {required bool isFavourite}) {
    final updatedProduct = state
        .firstWhere((element) => element.name == name)
        .copyWith(isFavourite: isFavourite);

    state = [
      for (int i = 0; i < state.length; i++)
        if (state[i].name == name) updatedProduct else state[i]
    ];
  }
}
