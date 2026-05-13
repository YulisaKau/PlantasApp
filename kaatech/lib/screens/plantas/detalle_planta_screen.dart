import 'package:flutter/material.dart';

import '../../models/planta_model.dart';

class DetallePlantaScreen extends StatelessWidget {

  final Planta planta;

  const DetallePlantaScreen({
    super.key,
    required this.planta,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          Theme.of(context)
              .scaffoldBackgroundColor,

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // 🌿 imagen principal
            Stack(

              children: [

                Hero(

                  tag: planta.nombre,

                  child: Container(

                    height: 320,
                    width: double.infinity,

                    decoration: BoxDecoration(

                      image: DecorationImage(

                        image:
                            AssetImage(
                          planta.imagen,
                        ),

                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Container(

                  height: 320,

                  decoration: BoxDecoration(

                    gradient: LinearGradient(

                      begin:
                          Alignment.topCenter,

                      end:
                          Alignment.bottomCenter,

                      colors: [

                        Colors.black
                            .withOpacity(0.2),

                        Colors.black
                            .withOpacity(0.7),
                      ],
                    ),
                  ),
                ),

                SafeArea(

                  child: Padding(

                    padding:
                        const EdgeInsets.all(
                      16,
                    ),

                    child: Row(

                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,

                      children: [

                        CircleAvatar(

                          backgroundColor:
                              Colors.white,

                          child: IconButton(

                            icon: const Icon(
                              Icons.arrow_back,
                              color:
                                  Colors.black,
                            ),

                            onPressed: () {

                              Navigator.pop(
                                context,
                              );
                            },
                          ),
                        ),

                        CircleAvatar(

                          backgroundColor:
                              Colors.white,

                          child: IconButton(

                            icon: const Icon(
                              Icons.favorite_border,
                              color:
                                  Colors.red,
                            ),

                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(

                  bottom: 30,
                  left: 20,

                  child: Column(

                    crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                    children: [

                      Text(

                        planta.nombre,

                        style: const TextStyle(

                          color: Colors.white,

                          fontSize: 34,

                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(
                          height: 8),

                      Container(

                        padding:
                            const EdgeInsets
                                .symmetric(

                          horizontal: 14,
                          vertical: 8,
                        ),

                        decoration:
                            BoxDecoration(

                          color: Colors.green,

                          borderRadius:
                              BorderRadius
                                  .circular(
                            20,
                          ),
                        ),

                        child: Text(

                          planta.categoria,

                          style:
                              const TextStyle(

                            color:
                                Colors.white,

                            fontWeight:
                                FontWeight
                                    .w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(

              padding:
                  const EdgeInsets.all(20),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment
                        .start,

                children: [

                  // 🌿 descripción
                  Text(

                    "Descripción",

                    style: TextStyle(

                      fontSize: 24,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(

                    planta.descripcion,

                    style: TextStyle(

                      fontSize: 16,
                      height: 1.6,

                      color:
                          Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.color,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 🌿 beneficios
                  Text(

                    "Beneficios",

                    style: TextStyle(

                      fontSize: 24,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(

                    width: double.infinity,

                    padding:
                        const EdgeInsets.all(
                      18,
                    ),

                    decoration: BoxDecoration(

                      color:
                          Theme.of(context)
                              .cardColor,

                      borderRadius:
                          BorderRadius
                              .circular(20),

                      boxShadow: [

                        BoxShadow(
                          color: Colors.black
                              .withOpacity(
                            0.05,
                          ),

                          blurRadius: 8,
                        ),
                      ],
                    ),

                    child: Text(

                      planta.beneficios,

                      style: TextStyle(

                        fontSize: 16,
                        height: 1.6,

                        color:
                            Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.color,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 🌿 preparación
                  Text(

                    "Preparación",

                    style: TextStyle(

                      fontSize: 24,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(

                    width: double.infinity,

                    padding:
                        const EdgeInsets.all(
                      18,
                    ),

                    decoration: BoxDecoration(

                      color:
                          Theme.of(context)
                              .cardColor,

                      borderRadius:
                          BorderRadius
                              .circular(20),

                      boxShadow: [

                        BoxShadow(
                          color: Colors.black
                              .withOpacity(
                            0.05,
                          ),

                          blurRadius: 8,
                        ),
                      ],
                    ),

                    child: Text(

                      planta.preparacion,

                      style: TextStyle(

                        fontSize: 16,
                        height: 1.6,

                        color:
                            Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.color,
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // 🌎 origen
                  _buildInfoCard(
                    context: context,
                    icono: Icons.public,
                    titulo: "Origen",
                    contenido: planta.origen,
                  ),

                  const SizedBox(height: 18),

                  // 🍵 tipo consumo
                  _buildInfoCard(
                    context: context,
                    icono: Icons.local_cafe,
                    titulo:
                        "Tipo de consumo",
                    contenido:
                        planta.tipoConsumo,
                  ),

                  const SizedBox(height: 18),

                  // ⏰ frecuencia
                  _buildInfoCard(
                    context: context,
                    icono: Icons.schedule,
                    titulo:
                        "Frecuencia recomendada",
                    contenido:
                        planta.frecuencia,
                  ),

                  const SizedBox(height: 18),

                  // ⚠ contraindicaciones
                  _buildInfoCard(
                    context: context,
                    icono:
                        Icons.warning_amber,
                    titulo:
                        "Contraindicaciones",
                    contenido: planta
                        .contraindicaciones,
                  ),

                  const SizedBox(height: 30),

                  // 🌿 síntomas
                  Text(

                    "Síntomas que ayuda",

                    style: TextStyle(

                      fontSize: 22,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Wrap(

                    spacing: 10,
                    runSpacing: 10,

                    children: planta
                        .sintomas
                        .map((sintoma) {

                      return _buildChip(
                        sintoma,
                        Colors.green,
                      );

                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // 😊 emociones
                  Text(

                    "Emociones relacionadas",

                    style: TextStyle(

                      fontSize: 22,

                      fontWeight:
                          FontWeight.bold,

                      color:
                          Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.color,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Wrap(

                    spacing: 10,
                    runSpacing: 10,

                    children: planta
                        .emociones
                        .map((emocion) {

                      return _buildChip(
                        emocion,
                        Colors.teal,
                      );

                    }).toList(),
                  ),

                  const SizedBox(height: 30),

                  // ⭐ popularidad
                  _buildInfoCard(
                    context: context,
                    icono: Icons.star,
                    titulo:
                        "Nivel de popularidad",
                    contenido:
                        "${planta.popularidad}/5",
                  ),

                  const SizedBox(height: 18),

                  // 🧪 propiedades
                  _buildInfoCard(
                    context: context,
                    icono: Icons.science,
                    titulo: "Propiedades",
                    contenido:
                        planta.propiedades,
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({

    required BuildContext context,

    required IconData icono,

    required String titulo,

    required String contenido,
  }) {

    return Container(

      width: double.infinity,

      padding:
          const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color:
            Theme.of(context).cardColor,

        borderRadius:
            BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(
            color:
                Colors.black.withOpacity(
              0.05,
            ),

            blurRadius: 8,
          ),
        ],
      ),

      child: Row(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Icon(
            icono,
            color: Colors.green,
            size: 28,
          ),

          const SizedBox(width: 15),

          Expanded(

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment
                      .start,

              children: [

                Text(

                  titulo,

                  style: TextStyle(

                    fontSize: 17,

                    fontWeight:
                        FontWeight.bold,

                    color:
                        Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.color,
                  ),
                ),

                const SizedBox(height: 8),

                Text(

                  contenido,

                  style: TextStyle(

                    fontSize: 15,

                    color:
                        Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(
    String texto,
    Color color,
  ) {

    return Container(

      padding:
          const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),

      decoration: BoxDecoration(

        color:
            color.withOpacity(0.15),

        borderRadius:
            BorderRadius.circular(30),
      ),

      child: Text(

        texto,

        style: TextStyle(

          color: color,

          fontWeight:
              FontWeight.w600,
        ),
      ),
    );
  }
}