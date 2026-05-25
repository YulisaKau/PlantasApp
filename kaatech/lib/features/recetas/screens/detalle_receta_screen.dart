import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recetas_provider.dart';
import '../widgets/indicador_row.dart';
import '../widgets/seccion_info.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';

class DetalleRecetaScreen extends StatelessWidget {
  const DetalleRecetaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final planta = context.watch<RecetasProvider>().seleccionada;

    if (planta == null) {
      return const Scaffold(
        body: Center(child: Text('No hay planta seleccionada')),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header con emoji grande ───────
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Botón regresar
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<RecetasProvider>().limpiarSeleccion();
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        AppStrings.plantMonitoring.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Emoji grande
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: planta.color.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: planta.color.withValues(alpha: 0.4),
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        planta.emoji,
                        style: const TextStyle(fontSize: 56),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Nombre
                  Text(
                    planta.nombre.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Nombre científico
                  Text(
                    planta.nombreCientifico,
                    style: const TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),

            // ── Panel blanco con info ─────────
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Descripción
                      Text(
                        planta.descripcion,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyMedium?.color,
                          height: 1.6,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      // Indicadores
                      IndicadorRow(
                        label: AppStrings.hydration,
                        valor: planta.hidratacion,
                        color: const Color(0xFF52B788),
                      ),
                      const SizedBox(height: 10),
                      IndicadorRow(
                        label: AppStrings.nutrients,
                        valor: planta.nutrientes,
                        color: const Color(0xFF74C69D),
                      ),
                      const SizedBox(height: 10),
                      IndicadorRow(
                        label: AppStrings.temperature,
                        valor: planta.temperatura,
                        color: planta.color,
                      ),
                      const SizedBox(height: 20),

                      // Usos medicinales
                      SeccionInfo(
                        titulo: AppStrings.medicinalUses,
                        icono: Icons.healing_outlined,
                        contenido: planta.usos,
                        color: planta.color,
                      ),
                      const SizedBox(height: 14),

                      // Preparación
                      SeccionInfo(
                        titulo: AppStrings.preparation,
                        icono: Icons.local_cafe_outlined,
                        contenido: planta.preparacion,
                        color: planta.color,
                      ),
                      const SizedBox(height: 20),

                      // Botón guardar
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.bookmark_add_outlined,
                            size: 18,
                          ),
                          label: const Text(AppStrings.saveRecipe),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
