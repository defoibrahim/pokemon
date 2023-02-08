import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/pokemon.dart';

final isLoadingProductsProvider = StateProvider<bool>((ref) {
  return true;
});

final badgeProvider = StateProvider<int>((ref) {
  return ref.watch(bucketProvider.notifier).bucketList.length;
});

final bucketProvider =
    StateNotifierProvider<ProductsNotifier, List<Pokemon>>((ref) {
  return ProductsNotifier(ref: ref);
});

class ProductsNotifier extends StateNotifier<List<Pokemon>> {
  ProductsNotifier({required this.ref}) : super([]) {
    fetchProducts(ref: ref);
  }
  final Ref ref;
  List<Pokemon> bucketList = [];
  addBucket(Pokemon val) {
    if (bucketList.contains(val)) return;
    bucketList.add(val);
    state = bucketList;
  }

  removeBucket(Pokemon val) {
    bucketList.removeWhere((element) => element.name == val.name);
    state = bucketList;
  }

  Future fetchProducts({required Ref ref}) async {
    state = bucketList;
    Future.delayed(const Duration(seconds: 1)).then((value) {
      ref.read(isLoadingProductsProvider.notifier).state = false;
    });
  }

  // void toggleFavourite(String name, {required bool isFavourite}) {
  //   final updatedProduct = state
  //       .firstWhere((element) => element.name == name)
  //       .copyWith(isFavourite: isFavourite);

  //   state = [
  //     for (int i = 0; i < state.length; i++)
  //       if (state[i].name == name) updatedProduct else state[i]
  //   ];
  // }
}
