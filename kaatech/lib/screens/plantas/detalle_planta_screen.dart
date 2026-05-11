import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/planta_model.dart';
import '../../providers/favoritos_provider.dart';

class DetallePlantaScreen extends StatelessWidget {

  final Planta planta;

  const DetallePlantaScreen({
    super.key,
    required this.planta,
  });

  @override
  Widget build(BuildContext context) {

    final favoritosProvider =
        Provider.of<FavoritosProvider>(context);

    final esFavorito =
        favoritosProvider.esFavorito(planta);

    return Scaffold(

      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(

        backgroundColor: Colors.transparent,
        elevation: 0,

        iconTheme: const IconThemeData(
          color: Colors.white,
        ),

        actions: [

          IconButton(

            onPressed: () {

              favoritosProvider.toggleFavorito(planta);
            },

            icon: Icon(

              esFavorito
                  ? Icons.favorite
                  : Icons.favorite_border,

              color: Colors.white,
            ),
          ),
        ],
      ),

      extendBodyBehindAppBar: true,

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            // 🌿 HEADER PREMIUM
            Stack(

              children: [

                Hero(

                  tag: planta.imagen,

                  child: Image.asset(
                    planta.imagen,
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

                        planta.nombre,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

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

                          planta.categoria,

                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight:
                                FontWeight.w600,
                          ),
                        ),
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
                    planta.descripcion,
                  ),

                  const SizedBox(height: 25),

                  // 💚 beneficios
                  _buildSectionTitle(
                    context,
                    "Beneficios",
                  ),

                  const SizedBox(height: 12),

                  _buildBenefitItem(
                    "Ayuda al bienestar",
                  ),

                  _buildBenefitItem(
                    "Uso medicinal natural",
                  ),

                  _buildBenefitItem(
                    planta.beneficios,
                  ),

                  const SizedBox(height: 25),

                  // ☕ preparación
                  _buildSectionTitle(
                    context,
                    "Preparación",
                  ),

                  const SizedBox(height: 12),

                  _buildInfoCard(
                    context,
                    planta.preparacion,
                  ),

                  const SizedBox(height: 30),

                  // ❤️ botón favorito
                  SizedBox(

                    width: double.infinity,
                    height: 55,

                    child: ElevatedButton.icon(

                      onPressed: () {

                        favoritosProvider
                            .toggleFavorito(planta);
                      },

                      icon: Icon(

                        esFavorito
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),

                      label: Text(

                        esFavorito
                            ? "Quitar de favoritos"
                            : "Agregar a favoritos",
                      ),

                      style: ElevatedButton.styleFrom(

                        backgroundColor:
                            Colors.green,

                        foregroundColor:
                            Colors.white,

                        shape: RoundedRectangleBorder(
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