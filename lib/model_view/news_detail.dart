import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatefulWidget {
   final String? imageToUrl;
  final String description;
  final String? title;
  final String url;
  const NewsDetail({super.key, this.imageToUrl, required this.description, this.title, required this.url});

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    if (widget.imageToUrl!.isNotEmpty && widget.imageToUrl != null && widget.title != null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Khabar',
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.title!,
                        style: GoogleFonts.poppins(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 15, 8, 20),
                    child: Container(
                      height: 350,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: NetworkImage(widget.imageToUrl!),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.description,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(widget.url));
                      },
                      child: Text(
                        widget.url,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Text(
                  //     'Published on',
                  //     style: GoogleFonts.poppins(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //     textAlign: TextAlign.start,
                  //   ),
                  // ),
                ]),
          ),
        ),
      );
    } else if (widget.title != null) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Name',
            style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.title!,
                        style: GoogleFonts.poppins(fontSize: 25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      widget.description,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GestureDetector(
                      onTap: () async {
                        await launchUrl(Uri.parse(widget.url));
                      },
                      child: Text(
                        widget.url,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: Text(
                  //     'Published on',
                  //     style: GoogleFonts.poppins(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w400,
                  //     ),
                  //     textAlign: TextAlign.start,
                  //   ),
                  // ),
                ]),
          ),
        ),
      );
    } else {
      return const Placeholder();
    }
  }
}
