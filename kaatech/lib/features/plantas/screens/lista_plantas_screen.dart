import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/planta_model.dart';
import '../../../core/constants/app_colors.dart';
import 'detalle_planta_screen.dart';

class ListaPlantasScreen extends StatelessWidget {
  final String? categoria;

  const ListaPlantasScreen({super.key, this.categoria});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(categoria ?? 'Plantas')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('plantas')
            .where('categoria', isEqualTo: categoria)
            .snapshots(),
        builder: (context, snapshot) {
          // ── Cargando ──────────────────────
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primaryMedium),
            );
          }

          // ── Error ─────────────────────────
          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error al cargar plantas',
                style: TextStyle(color: AppColors.textSoft),
              ),
            );
          }

          // ── Plantas de Firestore ──────────
          final docsFirestore = snapshot.data?.docs ?? [];
          final plantasFirestore = docsFirestore.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Planta(
              nombre: data['nombre'] ?? '',
              imagen: data['imagen'] ?? 'assets/images/default.jpg',
              descripcion: data['descripcion'] ?? '',
              beneficios: data['beneficios'] ?? '',
              preparacion: data['preparacion'] ?? '',
              categoria: data['categoria'] ?? '',
            );
          }).toList();

          // ── Plantas locales filtradas ─────
          final plantasLocales = plantas
              .where((p) => p.categoria == categoria)
              .toList();

          // ── Combinar ambas listas ─────────
          final todasLasPlantas = [...plantasLocales, ...plantasFirestore];

          // ── Sin resultados ────────────────
          if (todasLasPlantas.isEmpty) {
            return const Center(
              child: Text(
                'No hay plantas en esta categoría',
                style: TextStyle(color: AppColors.textSoft),
              ),
            );
          }

          // ── Lista ─────────────────────────
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: todasLasPlantas.length,
            itemBuilder: (context, index) {
              final planta = todasLasPlantas[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      planta.imagen,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.primaryPale,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.local_florist,
                          color: AppColors.primaryMedium,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    planta.nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  subtitle: Text(
                    planta.categoria,
                    style: const TextStyle(color: AppColors.textSoft),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.primaryMedium,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetallePlantaScreen(planta: planta),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
