// lib/widgets_demo_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetsDemoScreen extends StatefulWidget {
  const WidgetsDemoScreen({Key? key}) : super(key: key);
  @override
  State<WidgetsDemoScreen> createState() => _WidgetsDemoScreenState();
}

class _WidgetsDemoScreenState extends State<WidgetsDemoScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    print('WidgetsDemoScreen: initState() - creando TabController');
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('WidgetsDemoScreen: didChangeDependencies()');
  }

  @override
  Widget build(BuildContext context) {
    print('WidgetsDemoScreen: build()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets demo'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.person), text: 'Perfil'),
            Tab(icon: Icon(Icons.list), text: 'Items'),
            Tab(icon: Icon(Icons.grid_on), text: 'Grid'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Perfil: botón para volver al Home completo
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Pestaña Perfil'),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => context.go('/'),
                  child: const Text('Ir al Home completo'),
                ),
              ],
            ),
          ),
          // Tab Items
          ListView.builder(
            itemCount: 20,
            itemBuilder: (c, i) => ListTile(title: Text('Elemento ${i + 1}')),
          ),
          // Tab Grid: items que llevan a Detail
          GridView.count(
            crossAxisCount: 2,
            children: List.generate(6, (i) {
              final id = i + 1;
              return Card(
                child: InkWell(
                  onTap: () {
                    context.push('/detail/$id?from=tabgrid');
                    print('WidgetsDemoScreen: push to /detail/$id?from=tabgrid');
                  },
                  child: Center(child: Text('G $id')),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    print('WidgetsDemoScreen: dispose() - limpiar TabController');
    _tabController.dispose();
    super.dispose();
  }
}
