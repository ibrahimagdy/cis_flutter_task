import 'package:cis_task/core/provider/favorites_provider.dart';
import 'package:cis_task/pages/favourite_page/favourite_view.dart';
import 'package:cis_task/pages/home_page/category_details.dart';
import 'package:cis_task/pages/home_page/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => FavoritesProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeView.routeName,
      routes: {
        HomeView.routeName: (context) => const HomeView(),
        DetailsOfCategory.routeName: (context) => const DetailsOfCategory(),
        FavouriteView.routeName: (context) => const FavouriteView(),
      },
    );
  }
}
