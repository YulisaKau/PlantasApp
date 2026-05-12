import 'package:flutter/material.dart';

import '../../models/receta_model.dart';

class DetalleRecetaScreen extends StatelessWidget {

  final Receta receta;

  const DetalleRecetaScreen({
    super.key,
    required this.receta,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,

      extendBodyBehindAppBar: true,

      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // ☕ HEADER
            Stack(

              children: [

                Hero(

                  tag: receta.imagen,

                  child: Image.asset(
                    receta.imagen,
                    width: double.infinity,
                    height: 320,
                    fit: BoxFit.cover,
                  ),
                ),

                Container(

                  height: 320,

                  decoration: BoxDecoration(

                    gradient: LinearGradient(

                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                      colors: [

                        Colors.black.withOpacity(0.2),
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),

                Positioned(

                  bottom: 25,
                  left: 20,

                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Text(

                        receta.nombre,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(

                        children: [

                          Container(

                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.green,

                              borderRadius:
                                  BorderRadius.circular(
                                20,
                              ),
                            ),

                            child: Text(

                              receta.beneficio,

                              style:
                                  const TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                          ),

                          const SizedBox(width: 10),

                          Container(

                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.orange,

                              borderRadius:
                                  BorderRadius.circular(
                                20,
                              ),
                            ),

                            child: Text(

                              receta.tiempo,

                              style:
                                  const TextStyle(
                                color: Colors.white,
                                fontWeight:
                                    FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(

              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // 📖 descripción
                  _buildSectionTitle(
                    context,
                    "Descripción",
                  ),

                  const SizedBox(height: 12),

                  _buildInfoCard(
                    context,
                    receta.descripcion,
                  ),

                  const SizedBox(height: 30),

                  // ☕ preparación
                  _buildSectionTitle(
                    context,
                    "Preparación",
                  ),

                  const SizedBox(height: 12),

                  _buildInfoCard(

                    context,

                    "1. Hervir agua.\n\n"
                    "2. Agregar la planta medicinal.\n\n"
                    "3. Dejar reposar 5 minutos.\n\n"
                    "4. Servir caliente.",
                  ),

                  const SizedBox(height: 30),

                  // 💚 beneficios
                  _buildSectionTitle(
                    context,
                    "Beneficios",
                  ),

                  const SizedBox(height: 12),

                  _buildBenefitItem(
                    "Ayuda al bienestar natural",
                  ),

                  _buildBenefitItem(
                    "Fácil de preparar",
                  ),

                  _buildBenefitItem(
                    receta.beneficio,
                  ),

                  const SizedBox(height: 35),

                  // ☕ botón
                  SizedBox(

                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(

                      onPressed: () {},

                      icon: const Icon(
                        Icons.local_cafe,
                      ),

                      label: const Text(
                        "Preparar receta",
                      ),

                      style: ElevatedButton.styleFrom(

                        backgroundColor:
                            Colors.green,

                        foregroundColor:
                            Colors.white,

                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                            18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🌿 títulos
  Widget _buildSectionTitle(
    BuildContext context,
    String title,
  ) {

    return Text(

      title,

      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,

        color: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.color,
      ),
    );
  }

  // 📦 cards
  Widget _buildInfoCard(
    BuildContext context,
    String text,
  ) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Theme.of(context).cardColor,

        borderRadius: BorderRadius.circular(22),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
          ),
        ],
      ),

      child: Text(
        text,

        style: const TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  // ✅ beneficios
  Widget _buildBenefitItem(String text) {

    return Padding(

      padding: const EdgeInsets.only(bottom: 12),

      child: Row(

        children: [

          const Icon(
            Icons.check_circle,
            color: Colors.green,
          ),

          const SizedBox(width: 10),

          Expanded(

            child: Text(
              text,

              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}