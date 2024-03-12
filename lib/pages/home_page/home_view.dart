import 'package:cis_task/model/category_data.dart';
import 'package:cis_task/pages/favourite_page/favourite_view.dart';
import 'package:cis_task/pages/widgets/category_item.dart';
import 'package:cis_task/pages/widgets/tab_bar_item.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String routeName = "home";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ChairModel? selectedCategory;
  int selectedIndex = 0;
  String searchQuery = "";
  List<ChairModel> chairs = [
    ChairModel(
        chairName: "Chair 1",
        chairImage: "assets/images/chair_1.png",
        chairImage2: "assets/images/chair_7.png",
        chairImage3: "assets/images/chair_8.png"),
    ChairModel(
        chairName: "Chair 2",
        chairImage: "assets/images/chair_2.png",
        chairImage2: "assets/images/chair_9.png",
        chairImage3: "assets/images/chair_10.png"),
    ChairModel(
        chairName: "Chair 3",
        chairImage: "assets/images/chair_3.png",
        chairImage2: "assets/images/chair_11.png",
        chairImage3: "assets/images/chair_12.png"),
    ChairModel(
        chairName: "Chair 4",
        chairImage: "assets/images/chair_4.png",
        chairImage2: "assets/images/chair_13.png",
        chairImage3: "assets/images/chair_14.png"),
    ChairModel(
        chairName: "Chair 5",
        chairImage: "assets/images/chair_5.png",
        chairImage2: "assets/images/chair_15.png",
        chairImage3: "assets/images/chair_16.png"),
    ChairModel(
        chairName: "Chair 6",
        chairImage: "assets/images/chair_6.png",
        chairImage2: "assets/images/chair_17.png",
        chairImage3: "assets/images/chair_18.png"),
  ];

  List<ChairModel> get filteredChairs {
    if (searchQuery.isEmpty) {
      return chairs;
    } else {
      return chairs
          .where((chair) =>
              chair.chairName.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Test"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, FavouriteView.routeName);
                },
                icon: const Icon(Icons.favorite_border)),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Search For Specific Product",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            TabBar(
                indicator: const BoxDecoration(
                  border: Border(bottom: BorderSide.none),
                ),
                onTap: (int index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabs: [
                  Tab(
                    child: TabBarItem(
                      title: "Button 1",
                      selected: selectedIndex == 0,
                    ),
                  ),
                  Tab(
                    child: TabBarItem(
                      title: "Button 2",
                      selected: selectedIndex == 1,
                    ),
                  ),
                  Tab(
                    child: TabBarItem(
                      title: "Button 3",
                      selected: selectedIndex == 2,
                    ),
                  ),
                ]),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 9 / 11,
                ),
                itemBuilder: (context, index) {
                  if (index < filteredChairs.length) {
                    final chairModel = filteredChairs[index];
                    return CategoryItem(
                      chairModel: chairModel,
                      index: index,
                      onItemClick: onItemClicked,
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
                itemCount: chairs.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  onItemClicked(ChairModel chairModel) {
    selectedCategory = chairModel;
    setState(() {});
  }
}
