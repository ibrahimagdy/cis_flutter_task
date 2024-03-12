import 'package:cis_task/core/provider/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteView extends StatelessWidget {
  static const String routeName = "fav";

  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favorites = favoritesProvider.favorites;
    final itemCount = favorites.length;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Favorites ($itemCount)"),
      ),
      body: ListView.separated(
        itemCount: favorites.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final chairModel = favorites[index];
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 236, 236),
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: Image.asset(chairModel.chairImage),
              title: Text(chairModel.chairName),
              trailing: IconButton(
                onPressed: () {
                  favoritesProvider.removeFromFavorites(chairModel);
                },
                icon: const Icon(Icons.favorite, color: Colors.blue),
              ),
            ),
          );
        },
      ),
    );
  }
}
