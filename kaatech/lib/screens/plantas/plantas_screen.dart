import 'package:flutter/material.dart';
import 'lista_plantas_screen.dart';

class PlantasScreen extends StatelessWidget {
  const PlantasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categorias = [
      'Digestivas',
      'Respiratorias',
      'Urinarias',
      'Circulatorias',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plantas Medicinales'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: categorias.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columnas
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final categoria = categorias[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ListaPlantasScreen(categoria: categoria),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    categoria,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
