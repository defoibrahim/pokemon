import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:pokemony/features/favorite/favorite_page.dart';
import 'package:pokemony/features/profile/profile_page.dart';

import '../../providers/pokemon_provider.dart';
import '../pokemon/pokemon_page.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  List<Widget> pages = [
    const ProfilePage(),
    const PokemonPage(),
    const FavoritePage(),
  ];
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
    return DoubleBack(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Pokemony'),
        //   centerTitle: true,
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         ref.read(authenticationProvider).signOut();
        //       },
        //       icon: const Icon(Icons.exit_to_app),
        //     )
        //   ],
        // ),
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
