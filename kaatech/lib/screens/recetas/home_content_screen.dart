import 'package:flutter/material.dart';
import '../plantas/lista_plantas_screen.dart';
import '../plantas/detalle_planta_screen.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {

    final plantas = ['Manzanilla', 'Hierbabuena', 'Jengibre', 'Aloe Vera'];

    return SafeArea(
      child: Column(
        children: [

          // 🔍 Buscador
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar plantas...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 🌿 Categorías
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _categoriaItem(context, 'Digestivas'),
                _categoriaItem(context, 'Respiratorias'),
                _categoriaItem(context, 'Urinarias'),
                _categoriaItem(context, 'Circulatorias'),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 📋 Plantas
          Expanded(
            child: GridView.builder(
              itemCount: plantas.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetallePlantaScreen(nombre: plantas[index]),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.local_florist,
                            size: 50, color: Colors.green),
                        const SizedBox(height: 10),
                        Text(plantas[index]),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Categoría con navegación
  Widget _categoriaItem(BuildContext context, String categoria) {
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
        width: 120,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            categoria,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}