// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'expansion_panel_demo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appBarTitle = "Hola, Flutter";
  final String studentName = "Juan Camilo Mena Ceron";
  int counter = 0;

  // initState: se ejecuta una sola vez al crear el State.
  @override
  void initState() {
    super.initState();
    print('HomePage: initState() - inicializa estado local.');
  }

  // didChangeDependencies: se ejecuta cuando cambian dependencias.
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('HomePage: didChangeDependencies() - dependencias cargadas/cambiadas.');
  }

  void _changeTitle() {
    setState(() {
      appBarTitle = appBarTitle == "Hola, Flutter" ? "¡Titulo cambiado!" : "Hola, Flutter";
    });
    // imprimimos aquí para evidenciar setState()
    print('HomePage: setState() -> appBarTitle="$appBarTitle"');

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Titulo actualizado correctamente")),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('HomePage: build() - reconstruyendo UI.');
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        actions: [
          IconButton(
            tooltip: 'Ir a Widgets demo (Tabs)',
            icon: const Icon(Icons.widgets),
            onPressed: () => context.push('/widgets'),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Texto de mi nombre
            Text(
              studentName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // row con imágenes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.network(
                  "https://picsum.photos/100/100",
                  width: 100,
                  height: 100,
                ),
                Image.asset(
                  "assets/local_image.jpg",
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Botón para cambiar título
            ElevatedButton(
              onPressed: _changeTitle,
              child: const Text("Cambiar Titulo"),
            ),
            const SizedBox(height: 20),

            // Widgets adicionales (container + lista horizontal)
            _buildAdditionalWidgets(),

            const SizedBox(height: 20),

            // --- GRIDVIEW para cumplir requisito (pequeño y manejable) ---
            SizedBox(
              height: 250,
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final id = index + 1;
                  return Card(
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        // push: apila la nueva ruta
                        context.push('/detail/$id?from=grid');
                        print('HomePage: Grid item $id tapped -> push to detail/$id?from=grid');
                      },
                      child: Center(child: Text('Item $id', style: const TextStyle(fontSize: 18))),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // Botones para demostrar go / push / replace
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // go(): reemplaza historial con la nueva ruta
                  context.goNamed(
                    'detail',
                    pathParameters: {'id': '100'},
                    queryParameters: {'from': 'go'},
                  );
                    print('HomePage: navegado con go -> detail/100?from=go');
                  },
                  child: const Text('Ir con go'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // push(): apila la nueva ruta en el stack
                    context.push('/detail/200?from=push');
                    print('HomePage: navegado con push -> detail/200?from=push');
                  },
                  child: const Text('Ir con push'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // replace(): reemplaza la ruta actual
                    context.replace('/detail/300?from=replace');
                    print('HomePage: navegado con replace -> detail/300?from=replace');
                  },
                  child: const Text('Ir con replace'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ExpansionPanel demo (tercer widget) embebido
            ExpansionPanelDemo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
          print('HomePage: setState() -> counter=$counter');
        },
        child: Text('$counter'),
      ),
    );
  }

  // widgets adicionales
  Widget _buildAdditionalWidgets() {
    return Column(
      children: [
        // 1 Container
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text("Container con estilo"),
        ),

        // 2. lista horizontal
        SizedBox(
          height: 150,
          child: ListView(
            children: const [
              ListTile(leading: Icon(Icons.star), title: Text("Elemento 1")),
              ListTile(leading: Icon(Icons.star), title: Text("Elemento 2")),
              ListTile(leading: Icon(Icons.star), title: Text("Elemento 3")),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    print('HomePage: dispose() - liberar recursos.');
    super.dispose();
  }
}
