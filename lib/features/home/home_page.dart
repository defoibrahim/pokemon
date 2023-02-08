import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:pokemony/features/bucket/bucket_page.dart';
import 'package:pokemony/features/favorite/favorite_page.dart';
import 'package:pokemony/features/profile/profile_page.dart';
import 'package:badges/badges.dart' as badges;
import '../../providers/bucket_provider.dart';
import '../../providers/pokemon_provider.dart';
import '../pokemon/pokemon_page.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  List<Widget> pages = [
    const ProfilePage(),
    PokemonPage(),
    const FavoritePage(),
  ];
  String getTitle(int val) {
    switch (val) {
      case 0:
        return 'Profile';
      case 1:
        return 'Pokemony';
      case 2:
        return 'Favorite';
      default:
    }
    return '';
  }

  List<TabItem> tabItems = List.of([
    TabItem(Icons.person_2_outlined, "Profile", Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.home, "Home", Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.favorite, "Favorite", Colors.blue,
        labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
  ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int menuIndex = ref.watch(indexProvider);
    int itemCount = ref.watch(bucketProvider.notifier).bucketList.length;
    return DoubleBack(
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTitle(menuIndex)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => BucketPage());
              },
              icon: badges.Badge(
                badgeContent: Text(
                  '${itemCount}',
                  style: TextStyle(fontSize: 14),
                ),
                child: Icon(Icons.add_shopping_cart),
              ),
            )
          ],
        ),
        body: pages[menuIndex],
        bottomNavigationBar: MoltenBottomNavigationBar(
          selectedIndex: menuIndex,
          onTabChange: (clickedIndex) {
            ref.watch(indexProvider.notifier).state = clickedIndex;
          },
          tabs: [
            MoltenTab(icon: const Icon(Icons.person_2_outlined)),
            MoltenTab(icon: const Icon(Icons.home)),
            MoltenTab(icon: const Icon(Icons.favorite)),
          ],
        ),
      ),
    );
  }
}
