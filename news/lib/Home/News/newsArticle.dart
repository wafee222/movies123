import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:news/Model/newsResponce.dart';

class NewsArticle extends StatelessWidget {
  final Articles news;

  NewsArticle({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title ?? ''),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(news.urlToImage ?? ''),
            ),
            SizedBox(height: 10),
            Text(
              news.author ?? '',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              news.title ?? '',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              news.description ?? '',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'View Full Article',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(url: news.url ?? ''),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 24,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    print('URL: $url');
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Article'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageFinished: (String url) {
          print('Page finished loading: $url');
        },
        onWebResourceError: (WebResourceError error) {
          print('Web resource error: ${error.description}');
        },
      ),
    );
  }
}
