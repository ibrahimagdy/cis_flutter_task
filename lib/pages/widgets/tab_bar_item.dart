import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  final bool selected;

  const TabBarItem({super.key, required this.title, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color:
            selected ? Colors.blue : const Color.fromARGB(255, 240, 236, 236),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: selected ? Colors.white : Colors.blue,
        ),
      ),
    );
  }
}
