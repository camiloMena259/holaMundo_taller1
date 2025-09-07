import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller 1 Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appBarTitle = "Hola, Flutter";
  final String studentName = "Juan Camilo Mena Ceron";

  void _changeTitle() {
    setState(() {
      appBarTitle = appBarTitle == "Hola, Flutter" 
          ? "¡Titulo cambiado!" 
          : "Hola, Flutter";
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Titulo actualizado correctamente")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
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
            
            // row con imagenes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Imagen de la network
                Image.network(
                  "https://picsum.photos/100/100",
                  width: 100,
                  height: 100,
                ),
                // Imagen de assets, con manejo de error, se creo la carpeta assets y se agrego la imagen
                Image.asset(
                  "assets/local_image.jpg",
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Boton para cambiar titulo
            ElevatedButton(
              onPressed: _changeTitle,
              child: const Text("Cambiar Titulo"),
            ),
            const SizedBox(height: 20),
            
            // llamo a widgets adicionales 
            _buildAdditionalWidgets(),
          ],
        ),
      ),
    );
  }

  // wdgets adicionales
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
}