import 'package:flutter/material.dart';

import '../../models/planta_model.dart';
import '../../models/rutina_model.dart';
import '../../models/categoria_model.dart';

import '../../widgets/plant_card.dart';
import '../../widgets/rutina_card.dart';
import '../../widgets/explorar_card.dart';

import '../plantas/detalle_planta_screen.dart';
import '../rutinas/rutina_detalle_screen.dart';

class HomeContent extends StatefulWidget {

  const HomeContent({super.key});

  @override
  State<HomeContent> createState() =>
      _HomeContentState();
}

class _HomeContentState
    extends State<HomeContent> {

  List<Planta> plantasFiltradas = plantas;

  String categoriaSeleccionada = "";

  // 🔍 buscar planta
  void buscarPlanta(String texto) {

    final resultados =
        plantas.where((planta) {

      final nombre =
          planta.nombre.toLowerCase();

      final busqueda =
          texto.toLowerCase();

      return nombre.contains(
        busqueda,
      );

    }).toList();

    setState(() {

      plantasFiltradas =
          resultados;
    });
  }

  // 🌿 filtrar categoría
  void filtrarCategoria(
      String categoria) {

    setState(() {

      categoriaSeleccionada =
          categoria;

      plantasFiltradas =
          plantas.where((planta) {

        return planta.categoria ==
            categoria;

      }).toList();
    });
  }

  // 🧠 recomendaciones inteligentes
  void filtrarNecesidad(
    String necesidad,
  ) {

    final resultados =
        plantas.where((planta) {

      final sintomas =
          planta.sintomas;

      final emociones =
          planta.emociones;

      return sintomas.contains(
                necesidad,
              ) ||
          emociones.contains(
            necesidad,
          );
    }).toList();

    setState(() {

      plantasFiltradas =
          resultados;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          Theme.of(context)
              .scaffoldBackgroundColor,

      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.all(16),

          child: SingleChildScrollView(

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                // 👋 saludo
                Text(

                  "Hola, Alex 🌿",

                  style: TextStyle(

                    fontSize: 28,

                    fontWeight:
                        FontWeight.bold,

                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,
                  ),
                ),

                const SizedBox(height: 20),

                // 🔍 buscador
                TextField(

                  onChanged:
                      buscarPlanta,

                  decoration:
                      InputDecoration(

                    hintText:
                        "Buscar planta...",

                    prefixIcon:
                        const Icon(
                      Icons.search,
                    ),

                    filled: true,

                    fillColor:
                        Theme.of(context)
                            .cardColor,

                    contentPadding:
                        const EdgeInsets.symmetric(
                      vertical: 18,
                    ),

                    border:
                        OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(
                        18,
                      ),

                      borderSide:
                          BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // 🌿 planta del día
                Container(

                  height: 220,

                  decoration: BoxDecoration(

                    borderRadius:
                        BorderRadius.circular(
                      28,
                    ),

                    image:
                        const DecorationImage(

                      image: AssetImage(
                        "assets/images/manzanilla.jpg",
                      ),

                      fit: BoxFit.cover,
                    ),
                  ),

                  child: Container(

                    padding:
                        const EdgeInsets.all(
                      20,
                    ),

                    decoration:
                        BoxDecoration(

                      borderRadius:
                          BorderRadius.circular(
                        28,
                      ),

                      gradient:
                          LinearGradient(

                        begin:
                            Alignment.topCenter,

                        end:
                            Alignment.bottomCenter,

                        colors: [

                          Colors.black
                              .withOpacity(
                            0.2,
                          ),

                          Colors.black
                              .withOpacity(
                            0.7,
                          ),
                        ],
                      ),
                    ),

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      mainAxisAlignment:
                          MainAxisAlignment.end,

                      children: [

                        const Text(

                          "🌿 Planta del día",

                          style: TextStyle(

                            color:
                                Colors.white70,

                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(
                            height: 8),

                        const Text(

                          "Manzanilla",

                          style: TextStyle(

                            color:
                                Colors.white,

                            fontSize: 30,

                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                            height: 8),

                        const Text(

                          "Ideal para relajación y dolor estomacal",

                          style: TextStyle(

                            color:
                                Colors.white70,

                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(
                            height: 10),

                        ElevatedButton(

                          onPressed: () {

                            final planta =
                                plantas.first;

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    DetallePlantaScreen(
                                  planta:
                                      planta,
                                ),
                              ),
                            );
                          },

                          style:
                              ElevatedButton
                                  .styleFrom(

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

                // 🌿 explorar
                Text(

                  "Explorar",

                  style: TextStyle(

                    fontSize: 22,

                    fontWeight:
                        FontWeight.bold,

                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(

                  height: 220,

                  child: ListView(

                    scrollDirection:
                        Axis.horizontal,

                    children:
                        categorias.map(
                      (categoria) {

                        return ExplorarCard(

                          titulo:
                              categoria.nombre,

                          descripcion:
                              categoria
                                  .descripcion,

                          icono:
                              categoria.icono,

                          color:
                              categoria.color,

                          onTap: () {

                            filtrarCategoria(
                              categoria
                                  .nombre,
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),

                const SizedBox(height: 35),

                // 🧠 necesidades
                Text(

                  "¿Cómo te sientes hoy?",

                  style: TextStyle(

                    fontSize: 22,

                    fontWeight:
                        FontWeight.bold,

                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(

                  height: 55,

                  child: ListView(

                    scrollDirection:
                        Axis.horizontal,

                    children: [

                      _buildNeedChip(
                        "😴 Insomnio",
                        "Insomnio",
                      ),

                      _buildNeedChip(
                        "😰 Ansiedad",
                        "Ansiedad",
                      ),

                      _buildNeedChip(
                        "🤧 Gripe",
                        "Gripe",
                      ),

                      _buildNeedChip(
                        "🤢 Náuseas",
                        "Náuseas",
                      ),

                      _buildNeedChip(
                        "⚡ Fatiga",
                        "Fatiga",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // 🌙 rutinas
                Text(

                  "Rutinas naturales",

                  style: TextStyle(

                    fontSize: 22,

                    fontWeight:
                        FontWeight.bold,

                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,
                  ),
                ),

                const SizedBox(height: 18),

                SizedBox(

                  height: 230,

                  child: ListView(

                    scrollDirection:
                        Axis.horizontal,

                    children:
                        rutinas.map(
                      (rutina) {

                        return RutinaCard(

                          titulo:
                              rutina.titulo,

                          descripcion:
                              rutina
                                  .descripcion,

                          emoji:
                              rutina.emoji,

                          onTap: () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    RutinaDetalleScreen(
                                  rutina:
                                      rutina,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),

                const SizedBox(height: 35),

                // 🌿 plantas
                Text(

                  "Plantas recomendadas",

                  style: TextStyle(

                    fontSize: 22,

                    fontWeight:
                        FontWeight.bold,

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
                        plantasFiltradas.map(
                      (planta) {

                        return PlantCard(

                          name:
                              planta.nombre,

                          image:
                              planta.imagen,

                          onTap: () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    DetallePlantaScreen(
                                  planta:
                                      planta,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNeedChip(
    String texto,
    String necesidad,
  ) {

    return GestureDetector(

      onTap: () {

        filtrarNecesidad(
          necesidad,
        );
      },

      child: Container(

        margin:
            const EdgeInsets.only(
          right: 12,
        ),

        padding:
            const EdgeInsets.symmetric(
          horizontal: 20,
        ),

        decoration: BoxDecoration(

          color:
              Theme.of(context)
                  .cardColor,

          borderRadius:
              BorderRadius.circular(
            20,
          ),

          boxShadow: [

            BoxShadow(

              color: Colors.black
                  .withOpacity(0.05),

              blurRadius: 8,
            ),
          ],
        ),

        alignment: Alignment.center,

        child: Text(

          texto,

          style: TextStyle(

            color:
                Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.color,

            fontWeight:
                FontWeight.w600,
          ),
        ),
      ),
    );
  }
}