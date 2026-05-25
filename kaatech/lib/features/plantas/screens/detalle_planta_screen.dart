import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planta_model.dart';
import '../providers/favoritos_provider.dart';

class DetallePlantaScreen extends StatelessWidget {
  final Planta planta;

  const DetallePlantaScreen({super.key, required this.planta});

  @override
  Widget build(BuildContext context) {
    final favoritosProvider = Provider.of<FavoritosProvider>(context);
    final esFavorito = favoritosProvider.esFavorito(planta);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Imagen principal ──────────────
            Stack(
              children: [
                Hero(
                  tag: planta.nombre,
                  child: Container(
                    height: 320,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(planta.imagen),
                        fit: BoxFit.cover,
                      ),
                    ),
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
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(
                              esFavorito
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () =>
                                favoritosProvider.toggleFavorito(planta),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planta.nombre,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          planta.categoria,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(context, "Descripción"),
                  const SizedBox(height: 12),
                  Text(
                    planta.descripcion,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                  const SizedBox(height: 30),

                  _buildSectionTitle(context, "Beneficios"),
                  const SizedBox(height: 12),
                  _buildCard(context, planta.beneficios),
                  const SizedBox(height: 30),

                  _buildSectionTitle(context, "Preparación"),
                  const SizedBox(height: 12),
                  _buildCard(context, planta.preparacion),
                  const SizedBox(height: 25),

                  _buildInfoCard(
                    context,
                    Icons.public,
                    "Origen",
                    planta.origen,
                  ),
                  const SizedBox(height: 18),
                  _buildInfoCard(
                    context,
                    Icons.local_cafe,
                    "Tipo de consumo",
                    planta.tipoConsumo,
                  ),
                  const SizedBox(height: 18),
                  _buildInfoCard(
                    context,
                    Icons.schedule,
                    "Frecuencia recomendada",
                    planta.frecuencia,
                  ),
                  const SizedBox(height: 18),
                  _buildInfoCard(
                    context,
                    Icons.warning_amber,
                    "Contraindicaciones",
                    planta.contraindicaciones,
                  ),
                  const SizedBox(height: 18),
                  _buildInfoCard(
                    context,
                    Icons.science,
                    "Propiedades",
                    planta.propiedades,
                  ),
                  const SizedBox(height: 30),

                  _buildSectionTitle(context, "Síntomas que ayuda"),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: planta.sintomas
                        .map((s) => _buildChip(s, Colors.green))
                        .toList(),
                  ),
                  const SizedBox(height: 30),

                  _buildSectionTitle(context, "Emociones relacionadas"),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: planta.emociones
                        .map((e) => _buildChip(e, Colors.teal))
                        .toList(),
                  ),
                  const SizedBox(height: 30),

                  _buildInfoCard(
                    context,
                    Icons.star,
                    "Nivel de popularidad",
                    "${planta.popularidad}/5",
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

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }

  Widget _buildCard(BuildContext context, String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context,
    IconData icono,
    String titulo,
    String contenido,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icono, color: Colors.green, size: 28),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  contenido,
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String texto, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        texto,
        style: TextStyle(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
