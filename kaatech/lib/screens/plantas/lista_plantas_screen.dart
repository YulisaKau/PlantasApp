import 'package:flutter/material.dart';

import '../../models/planta_model.dart';
import 'detalle_planta_screen.dart';

class ListaPlantasScreen extends StatelessWidget {

  final String? categoria;

  const ListaPlantasScreen({
    super.key,
    this.categoria,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFFF1F8F4),

      appBar: AppBar(
        title: Text(categoria ?? "Plantas"),
        backgroundColor: Colors.green,
      ),

      body: ListView.builder(

        itemCount: plantas.length,

        itemBuilder: (context, index) {

          final planta = plantas[index];

          return Card(

            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),

            child: ListTile(

              contentPadding: const EdgeInsets.all(10),

              leading: ClipRRect(

                borderRadius: BorderRadius.circular(12),

                child: Image.asset(
                  planta.imagen,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),

              title: Text(
                planta.nombre,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text(planta.categoria),

              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (context) =>
                        DetallePlantaScreen(
                      planta: planta,
                    ),
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