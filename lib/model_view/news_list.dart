import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsRowList extends StatefulWidget {
  final String? imageToUrl;
  final String description;
  const NewsRowList({super.key, this.imageToUrl, required this.description});

  @override
  State<NewsRowList> createState() => _NewsRowListState();
}

class _NewsRowListState extends State<NewsRowList> {
  @override
  Widget build(BuildContext context) {
     if (widget.imageToUrl != null && widget.imageToUrl!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 124,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(widget.imageToUrl!), fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: 180,
                  height: 124,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.description,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 235,
                  height: 124,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      widget.description,
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}
}