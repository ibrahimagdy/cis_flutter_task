import 'package:cis_task/core/provider/favorites_provider.dart';
import 'package:cis_task/model/category_data.dart';
import 'package:cis_task/pages/home_page/category_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final ChairModel chairModel;
  final int index;
  final Function onItemClick;

  const CategoryItem({
    super.key,
    required this.chairModel,
    required this.index,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsOfCategory.routeName,
          arguments: chairModel,
        );
      },
      child: Consumer<FavoritesProvider>(
        builder: (context, favoritesProvider, child) {
          final isFavorite = favoritesProvider.isFavorite(chairModel);
          return Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 236, 236),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(chairModel.chairImage),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(chairModel.chairName),
                    IconButton(
                      onPressed: () {
                        if (isFavorite) {
                          favoritesProvider.removeFromFavorites(chairModel);
                        } else {
                          favoritesProvider.addToFavorites(chairModel);
                        }
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.blue : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
