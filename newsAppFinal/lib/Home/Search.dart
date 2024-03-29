import 'package:flutter/material.dart';
import 'Api/ApiManager.dart';
import 'Model/newsResponce.dart';

class SearchIc extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.searchNews(query),
      builder: (context, AsyncSnapshot<NewsResponce?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData && snapshot.data != null) {
          // Handle displaying search results here
          // For example, you can use ListView.builder to display a list of search results
          return ListView.builder(
            itemCount: snapshot.data!.articles?.length,
            itemBuilder: (context, index) {
              // Assuming each article has a title, description, and image URL, you can display them here
              var article = snapshot.data!.articles![index];
              return Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    article.title ?? 'No title available',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(article.description ?? 'No description available'),
                  leading: article.urlToImage != null
                      ? CircleAvatar(
                    backgroundImage: NetworkImage(article.urlToImage!),
                  )
                      : null,
                  onTap: () {
                    // Navigate to the detail page of the selected article
                    // You can implement navigation according to your app's navigation stack
                  },
                ),
              );
            },
          );
        } else {
          return Center(child: Text('No results found'));
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // You can build suggestions as the user types here
    return Container();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.black, // Change the color to black
          fontSize: 20.0,
        ),
      ),
    );
  }
}
