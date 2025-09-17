import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/Widget/ItemCard.dart';
import 'package:flutteranimationdemo/utils/ButtonBuilder.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ButtonBuilder buttonBuilder = ButtonBuilder();

  bool isShowingProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: GridView.count(crossAxisCount: 2, children: _fillView(context)),
    );
  }

  _fillView(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 20; i++) {
      var item = Text("Item $i", style: TextStyle(fontSize: 24));
      items.add(
        ItemCard(
          item: item,
          imageUrl: "https://picsum.photos/200/300?random=$i",
        ),
      );
    }
    return items;
  }
}
