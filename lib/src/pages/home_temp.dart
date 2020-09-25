import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List options = ['One', 'Two', 'Three', 'Four', 'Five'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Components Temp")),
      body: ListView(
        // children: _createItems(),
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItems() {
    List<Widget> list = new List<Widget>();
    for (var option in options) {
      final Widget tempWidget = ListTile(
        title: Text(option),
      );
      list..add(tempWidget)..add(Divider());
    }
    return list;
  }

  List<Widget> _createItemsShort() {
    return options.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text("$item!"),
            subtitle: Text("Subtitle"),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
