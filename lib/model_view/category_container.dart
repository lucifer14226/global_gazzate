import 'package:flutter/material.dart';
import 'package:global_gazzete/constant.dart';
import 'package:global_gazzete/home_screen.dart';

class CategoryContainer extends StatefulWidget {
  final String title;
  final String imageurl;
  const CategoryContainer({super.key, required this.title, required this.imageurl});

  @override
  State<CategoryContainer> createState() => _CategoryContainerState();
}

class _CategoryContainerState extends State<CategoryContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.imageurl),
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return HomeScreen(title: widget.title, date: currentdate);
                },
              ));
            },
            child: Center(
              child: Text(widget.title),
            ),
          )),
    );
  }
}