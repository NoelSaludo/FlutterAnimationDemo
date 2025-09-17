import 'package:flutter/material.dart';
import 'package:flutteranimationdemo/utils/ButtonBuilder.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ButtonBuilder buttonBuilder = ButtonBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: GridView.count(crossAxisCount: 2, children: _fillView(context)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.person),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
    );
  }

  _fillView(BuildContext context) {
    List<Widget> items = [];
    for (int i = 0; i < 20; i++) {
      var item = Text("Item $i", style: TextStyle(fontSize: 24));
      items.add(_createItemCard(item));
    }
    return items;
  }

  Widget _createItemCard(Text item) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Container(
        alignment: Alignment.center,
        height: 500,
        width: 200,
        child: item,
      ),
    );
  }
}
