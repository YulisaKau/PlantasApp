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

  List<Planta> plantasFiltradas = plantas;

  String categoriaSeleccionada = "";

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

  void filtrarCategoria(String categoria) {

    setState(() {

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

    return Scaffold(

      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // 👋 saludo
                Text(
                  "Hola, Alex 🌿",

                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,

                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,
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

                    fillColor:
                        Theme.of(context).cardColor,

                    contentPadding:
                        const EdgeInsets.symmetric(
                      vertical: 18,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(18),

                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // 🌿 PLANTA DEL DÍA
                Container(

                  height: 220,

                  decoration: BoxDecoration(

                    borderRadius:
                        BorderRadius.circular(28),

                    image: const DecorationImage(

                      image: AssetImage(
                        "assets/images/manzanilla.jpg",
                      ),

                      fit: BoxFit.cover,
                    ),
                  ),

                  child: Container(

                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(

                      borderRadius:
                          BorderRadius.circular(28),

                      gradient: LinearGradient(

                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,

                        colors: [

                          Colors.black.withOpacity(0.2),

                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      mainAxisAlignment:
                          MainAxisAlignment.end,

                      children: [

                        const Text(

                          "🌿 Planta del día",

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(

                          "Manzanilla",

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(

                          "Ideal para relajación y dolor estomacal",

                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 10),

                        ElevatedButton(

                          onPressed: () {

                            final planta = plantas.first;

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    DetallePlantaScreen(
                                  planta: planta,
                                ),
                              ),
                            );
                          },

                          style:
                              ElevatedButton.styleFrom(

                            backgroundColor:
                                Colors.white,

                            foregroundColor:
                                Colors.green,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                16,
                              ),
                            ),
                          ),

                          child: const Text(
                            "Ver más",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // 🌿 categorías
                Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    CategoryItem(

                      title: "Digestivas",
                      icon: Icons.spa,

                      isSelected:
                          categoriaSeleccionada ==
                              "Digestivas",

                      onTap: () {

                        filtrarCategoria(
                          "Digestivas",
                        );
                      },
                    ),

                    CategoryItem(

                      title: "Resp",
                      icon: Icons.air,

                      isSelected:
                          categoriaSeleccionada ==
                              "Respiratorias",

                      onTap: () {

                        filtrarCategoria(
                          "Respiratorias",
                        );
                      },
                    ),

                    CategoryItem(

                      title: "Relajantes",
                      icon:
                          Icons.self_improvement,

                      isSelected:
                          categoriaSeleccionada ==
                              "Relajantes",

                      onTap: () {

                        filtrarCategoria(
                          "Relajantes",
                        );
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                // 🌱 plantas destacadas
                Text(

                  "Plantas destacadas",

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,

                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(

                  height: 190,

                  child: ListView(

                    scrollDirection:
                        Axis.horizontal,

                    children:
                        plantasFiltradas.map((planta) {

                      return PlantCard(

                        name: planta.nombre,
                        image: planta.imagen,

                        onTap: () {

                          Navigator.push(

                            context,

                            MaterialPageRoute(

                              builder: (_) =>
                                  DetallePlantaScreen(
                                planta: planta,
                              ),
                            ),
                          );
                        },
                      );

                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}