import 'package:flutter/material.dart';
// import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utitls/icon_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components"),
      ),
      body: _getList(),
    );
  }

  Widget _getList() {
    // menuProvider.loadData();
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) =>
          ListView(
        children: _listItems(snapshot.data, context),
      ),
    );
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    // if (data == null) {
    //   return [];
    // }

    data.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage(),
          // );
          // Navigator.push(context, route);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
