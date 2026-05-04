import 'package:flutter/material.dart';
import 'detalle_planta_screen.dart';

class ListaPlantasScreen extends StatelessWidget {
  final String categoria;

  const ListaPlantasScreen({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    // Datos de ejemplo (luego los puedes mejorar)
    final plantas = ['Manzanilla', 'Hierbabuena', 'Jengibre'];

    return Scaffold(
      appBar: AppBar(title: Text(categoria), backgroundColor: Colors.green),
      body: ListView.builder(
        itemCount: plantas.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.local_florist, color: Colors.green),
              title: Text(plantas[index]),
              trailing: const Icon(Icons.arrow_forward_ios),

             
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetallePlantaScreen(nombre: plantas[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
