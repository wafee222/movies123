import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Home/tabItem.dart';
import 'package:news/Home/News/newsWidget.dart';
import 'package:news/Model/sourceResponce.dart';

class TabWidget extends StatefulWidget {

  List<Source> sourceList;

  TabWidget({ required this.sourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourceList.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                selectedIndex = index;
                setState(() {

                });
              },
                isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourceList.map((source) => TabItem(source: source,
            isSelected: selectedIndex == widget.sourceList.indexOf(source)

              )).toList()
            ),
            Expanded(child: NewsWidget(source: widget.sourceList[selectedIndex]))
          ],
        ),
    );
  }
}
