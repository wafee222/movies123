// NewsItem.dart

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/Model/newsResponce.dart';

class NewsItem extends StatelessWidget {
  final News news;
  final Function? onItemClick;

  NewsItem({required this.news, this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              onItemClick!(news);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? '',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
                placeholder: (context, url) => Container(
                  padding: EdgeInsets.only(
                    left: 150,
                    right: 150,
                    top: 80,
                    bottom: 80,
                  ),
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(news.author ?? '', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 8),
          Text(news.title ?? '', style: Theme.of(context).textTheme.bodyLarge),
          SizedBox(height: 8),
          Text(news.description ?? '', style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
