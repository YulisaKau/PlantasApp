import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/admin_card.dart';
import 'agregar_planta_screen.dart';
import 'agregar_receta_screen.dart';
import 'ver_plantas_screen.dart';
import 'ver_recetas_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ───────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: const [
                  Icon(
                    Icons.admin_panel_settings,
                    color: Colors.white70,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Panel Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ],
              ),
            ),

            // ── Panel blanco ──────────────────
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(28),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      'Gestión de contenido',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Agrega y administra plantas y recetas',
                      style: TextStyle(
                        fontSize: 13,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // ── Opciones ──────────────
                    AdminCard(
                      titulo: 'Agregar Planta',
                      subtitulo: 'Añade una nueva planta medicinal',
                      icono: Icons.local_florist,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AgregarPlantaScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    AdminCard(
                      titulo: 'Agregar Receta',
                      subtitulo: 'Añade una nueva receta medicinal',
                      icono: Icons.local_cafe_outlined,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AgregarRecetaScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    AdminCard(
                      titulo: 'Ver Plantas',
                      subtitulo: 'Administra las plantas existentes',
                      icono: Icons.list_alt,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VerPlantasScreen(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),

                    AdminCard(
                      titulo: 'Ver Recetas',
                      subtitulo: 'Administra las recetas existentes',
                      icono: Icons.menu_book,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const VerRecetasScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
