// lib/detail_page.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailPage extends StatefulWidget {
  final String id;
  final String from;
  const DetailPage({required this.id, required this.from, Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    print('DetailPage: initState() id=${widget.id} from=${widget.from}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('DetailPage: didChangeDependencies()');
  }

  @override
  Widget build(BuildContext context) {
    print('DetailPage: build() mostrando parámetros.');
    return Scaffold(
      appBar: AppBar(title: Text('Detail ${widget.id}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID recibido: ${widget.id}', style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text('Llegó desde: ${widget.from}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Volver atrás: si se puede pop -> pop, si no -> ir al home con go
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                  print('DetailPage: Navigator.pop()');
                } else {
                  context.go('/');
                  print('DetailPage: no hay historial, context.go("/")');
                }
              },
              child: const Text('Volver atrás'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    print('DetailPage: dispose()');
    super.dispose();
  }
}
