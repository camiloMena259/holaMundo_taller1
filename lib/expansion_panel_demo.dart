// lib/expansion_panel_demo.dart
import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<Item> items = List.generate(3, (i) => Item(header: 'Panel ${i + 1}', body: 'Contenido ${i + 1}', isExpanded: false));

  @override
  void initState() {
    super.initState();
    print('ExpansionPanelDemo: initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('ExpansionPanelDemo: build()');
    return ExpansionPanelList(
      expansionCallback: (index, isOpen) {
        setState(() {
          items[index].isExpanded = !isOpen;
        });
        print('ExpansionPanelDemo: setState() - toggled panel $index -> ${items[index].isExpanded}');
      },
      children: items.map((item) {
        return ExpansionPanel(
          headerBuilder: (context, isOpen) => ListTile(title: Text(item.header)),
          body: ListTile(title: Text(item.body)),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  @override
  void dispose() {
    print('ExpansionPanelDemo: dispose()');
    super.dispose();
  }
}

class Item {
  String header;
  String body;
  bool isExpanded;
  Item({required this.header, required this.body, this.isExpanded = false});
}
