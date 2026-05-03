import 'package:flutter/material.dart';

class DetallePlantaScreen extends StatelessWidget {
  final String nombre;

  const DetallePlantaScreen({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nombre),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen (placeholder por ahora)
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.local_florist,
                size: 80,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // Nombre
            Text(
              nombre,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // Descripción
            const Text(
              'Descripción:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Esta planta es conocida por sus múltiples beneficios medicinales y su uso tradicional.',
            ),

            const SizedBox(height: 15),

            // Propiedades
            const Text(
              'Propiedades:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('- Antiinflamatoria\n- Relajante\n- Digestiva'),

            const SizedBox(height: 15),

            // Usos
            const Text(
              'Usos:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text('- Infusiones\n- Remedios caseros'),

            const SizedBox(height: 15),

            // Precauciones
            const Text(
              'Precauciones:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Consumir con moderación. Consultar a un especialista si es necesario.',
            ),
          ],
        ),
      ),
    );
  }
}