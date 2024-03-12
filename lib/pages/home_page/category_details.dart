import 'package:cis_task/model/category_data.dart';
import 'package:cis_task/pages/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DetailsOfCategory extends StatefulWidget {
  static const String routeName = "details";

  const DetailsOfCategory({super.key});

  @override
  State<DetailsOfCategory> createState() => _DetailsOfCategoryState();
}

class _DetailsOfCategoryState extends State<DetailsOfCategory> {
  int currentIndex = 0;
  late List<String> images;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ChairModel;
    images = [
      args.chairImage,
      args.chairImage2,
      args.chairImage3,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("${args.chairName} Details"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                0.30, // Adjust the height as needed
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  if (currentIndex > 0) {
                    setState(() {
                      currentIndex--;
                    });
                    pageController.animateToPage(
                      currentIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      width: currentIndex == index ? 30 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                        color:
                            currentIndex == index ? Colors.blue : Colors.grey,
                      ),
                    ),
                  );
                }),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  if (currentIndex < images.length - 1) {
                    setState(() {
                      currentIndex++;
                    });
                    pageController.animateToPage(
                      currentIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                args.chairName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const Text(
                "5 Stars",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Desc ............",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 10),
          const CustomButton(
              buttonColor: Colors.yellow, buttonText: "Add to Cart"),
          const SizedBox(height: 10),
          const CustomButton(buttonColor: Colors.orange, buttonText: "Buy Now"),
        ],
      ),
    );
  }
}
