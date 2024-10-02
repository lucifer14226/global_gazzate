import 'dart:convert';
import 'package:global_gazzete/model/news_model.dart';
import 'package:global_gazzete/model_view/news_detail.dart';
import 'package:global_gazzete/model_view/news_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class NewListView extends StatefulWidget {
  final String title;
  final String date;
  const NewListView({super.key, required this.title, required this.date});

  @override
  State<NewListView> createState() => _NewListViewState();
}

class _NewListViewState extends State<NewListView> {
  List<NewsArticle> newsData = [];

  Future<void> getNewsData() async {
    String date = widget.date;
    const String API_KEY = '2284ee30e809483e838d37b14e1bc5af';
    String topic = "all";

    // https://newsapi.org/v2/everything?q=bitcoin&from=2023-06-20&sortBy=publishedAt&apiKey=7dd63a47e817437183b4af9c25e17f84
    try {
      final response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=$topic&from=$date&sortBy=publishedAt&apiKey=$API_KEY'),
      );
      print("hello");
      debugPrint(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body)['articles'];
        final List<NewsArticle> newsList = jsonData
            .map((data) => NewsArticle(
                  content: data['content'] ?? "",
                  title: data['title'] ?? "",
                  description: data['description'] ?? "",
                  url: data['url'] ?? "",
                  urlToImage: data['urlToImage'] ??
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlReqJhMmE46huL6nba-M1El1cft2s8jBPptbtWZv1aw&s",
                ))
            .toList();


        setState(() {
          newsData = newsList;
        });
      } else {
        // Handle error scenario
        debugPrint('Failed to fetch data from the Google News API');
      }
    } catch (e) {
      // Handle exception scenario
      debugPrint('Error: $e');
    }
  }
   @override
  void initState() {
    getNewsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newsData.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetail(
                      description: newsData[index].content,
                      imageToUrl: newsData[index].urlToImage,
                      title: newsData[index].title,
                      url: newsData[index].url),
            ));
          },
          child: NewsRowList(
            description: newsData[index].title,
            imageToUrl: newsData[index].urlToImage,
          ),
          );
      },
    );
  }
}