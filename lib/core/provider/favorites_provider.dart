import 'package:cis_task/model/category_data.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<ChairModel> favorites = [];

  void addToFavorites(ChairModel chairModel) {
    favorites.add(chairModel);
    notifyListeners();
  }

  void removeFromFavorites(ChairModel chairModel) {
    favorites.remove(chairModel);
    notifyListeners();
  }

  bool isFavorite(ChairModel chairModel) {
    return favorites.contains(chairModel);
  }
}
