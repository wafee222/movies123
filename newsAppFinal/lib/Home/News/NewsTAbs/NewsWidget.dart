// NewsWidget.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Model/SourceResponce.dart';
import '../../MyTheme.dart';
import 'NewsItem.dart';
import 'NewsItemViewModel.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({required this.source});
  static const String routeName = 'categoryDetails';

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetNewsModel viewModel = NewsWidgetNewsModel();

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsWidgetNewsModel>(
        builder: (context, viewModel, child) {
          if (viewModel.newList == null)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: MyTheme.primaryLightColor,
              ),
            );
          else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newList![index]);
              },
              itemCount: viewModel.newList!.length,
            );
          }
        },
      ),
    );
  }
}
