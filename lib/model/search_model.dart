import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:global_gazzete/constant.dart';
import 'package:global_gazzete/home_screen.dart';
import 'package:global_gazzete/model_view/news_detail.dart';
import 'package:http/http.dart' as http;
import 'package:global_gazzete/model/news_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "France",
    "Germany",
    "Austria",
    "Spain",
    "Venice",
  ];

  Future<List<NewsArticle>> searchNews(String query) async{
    String date = currentdate;
    const String API_KEY = '2284ee30e809483e838d37b14e1bc5af';

    // https://newsapi.org/v2/everything?q=bitcoin&from=2023-06-20&sortBy=publishedAt&apiKey=7dd63a47e817437183b4af9c25e17f84
    try {
      final response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/everything?q=$query&langauage=en&from=$date&sortBy=publishedAt&apiKey=$API_KEY'),
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
            return newsList;
      } else {
        // Handle error scenario
        debugPrint('Failed to fetch data from the Google News API');
        return [];
      }
    } catch (e) {
      // Handle exception scenario
      debugPrint('Error: $e');
      return [];
    }
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query="";
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
       close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Use FutureBuilder to display the search results
    return FutureBuilder<List<dynamic>>(
      future: searchNews(query), // Call the search function with the query
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No results found.'));
        } else {
          // Display search results
          final article = snapshot.data!;
          return ListView.builder(
            itemCount: article.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(article[index].title),
                onTap: () {
                  final description=article[index].description;
                    final url=article[index].url;
                    final urlToImage=article[index].urlToImage;
                    final title=article[index].title;
                    Navigator.of(context).push(  MaterialPageRoute(
                    builder: (context) {
                      
                    return NewsDetail(description: description, url: url,imageToUrl: urlToImage,title: title);
                    },
                  ));
                  // Open article URL
                },
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
        child: Text("Search News......"),
    );
  }
}