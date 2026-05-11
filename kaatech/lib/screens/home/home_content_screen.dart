import 'package:flutter/material.dart';

import '../../models/planta_model.dart';

import '../../widgets/category_item.dart';
import '../../widgets/plant_card.dart';

import '../plantas/detalle_planta_screen.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  // 🌿 lista filtrada
  List<Planta> plantasFiltradas = plantas;

  // 🌱 categoría seleccionada
  String categoriaSeleccionada = "";

  // 🔍 búsqueda
  void buscarPlanta(String texto) {

    final resultados = plantas.where((planta) {

      final nombre = planta.nombre.toLowerCase();
      final busqueda = texto.toLowerCase();

      return nombre.contains(busqueda);

    }).toList();

    setState(() {
      plantasFiltradas = resultados;
    });
  }

  // 🌱 filtrar categoría
  void filtrarCategoria(String categoria) {

    setState(() {

      // si tocan la misma categoría otra vez
      if (categoriaSeleccionada == categoria) {

        categoriaSeleccionada = "";
        plantasFiltradas = plantas;

      } else {

        categoriaSeleccionada = categoria;

        plantasFiltradas = plantas.where((planta) {

          return planta.categoria == categoria;

        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // 👋 saludo
              const Text(
                "Hola, Alex 🌿",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // 🔍 buscador
              TextField(

                onChanged: buscarPlanta,

                decoration: InputDecoration(

                  hintText: "Buscar planta...",
                  prefixIcon: const Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.white,

                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 18,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 🌱 categorías
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  CategoryItem(
  title: "Digestivas",
  icon: Icons.spa,

  isSelected:
      categoriaSeleccionada == "Digestivas",

  onTap: () {
    filtrarCategoria("Digestivas");
  },
),

                  CategoryItem(
  title: "Resp",
  icon: Icons.air,

  isSelected:
      categoriaSeleccionada == "Respiratorias",

  onTap: () {
    filtrarCategoria("Respiratorias");
  },
),

                  CategoryItem(
  title: "Relajantes",
  icon: Icons.self_improvement,

  isSelected:
      categoriaSeleccionada == "Relajantes",

  onTap: () {
    filtrarCategoria("Relajantes");
  },
),
                ],
              ),

              const SizedBox(height: 35),

              // 🌿 título
              const Text(
                "Plantas destacadas",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              // 🌿 cards dinámicas
              SizedBox(

                height: 190,

                child: ListView(

                  scrollDirection: Axis.horizontal,

                  children: plantasFiltradas.map((planta) {

                    return PlantCard(

                      name: planta.nombre,
                      image: planta.imagen,

                      onTap: () {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) => DetallePlantaScreen(
                              planta: planta,
                            ),
                          ),
                        );
                      },
                    );

                  }).toList(),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}