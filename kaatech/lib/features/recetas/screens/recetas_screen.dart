import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/recetas_provider.dart';
import '../widgets/planta_card.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import 'detalle_receta_screen.dart';

class RecetasScreen extends StatefulWidget {
  const RecetasScreen({super.key});

  @override
  State<RecetasScreen> createState() => _RecetasScreenState();
}

class _RecetasScreenState extends State<RecetasScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RecetasProvider>().cargarPlantas();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<RecetasProvider>();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ───────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Row(
                children: [
                  const Icon(
                    Icons.local_florist,
                    color: Colors.white70,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    AppStrings.recipesTitle,
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
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),

                    // ── Buscador ──────────────
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        controller: _searchController,
                        onChanged: (value) =>
                            context.read<RecetasProvider>().buscar(value),
                        decoration: InputDecoration(
                          hintText: 'Buscar planta o uso...',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey.shade400,
                            size: 18,
                          ),
                          suffixIcon: _searchController.text.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear, size: 18),
                                  onPressed: () {
                                    _searchController.clear();
                                    context.read<RecetasProvider>().buscar('');
                                  },
                                )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // ── Lista de plantas ──────
                    Expanded(child: _buildBody(provider)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(RecetasProvider provider) {
    switch (provider.status) {
      case RecetasStatus.loading:
        return const Center(
          child: CircularProgressIndicator(color: AppColors.primaryMedium),
        );

      case RecetasStatus.error:
        return Center(
          child: Text(
            provider.errorMessage ?? 'Error al cargar',
            style: const TextStyle(color: AppColors.textSoft),
          ),
        );

      case RecetasStatus.loaded:
        if (provider.plantas.isEmpty) {
          return const Center(
            child: Text(
              'No se encontraron plantas',
              style: TextStyle(color: AppColors.textSoft),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          itemCount: provider.plantas.length,
          separatorBuilder: (_, __) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final planta = provider.plantas[index];
            return PlantaCard(
              planta: planta,
              onTap: () {
                context.read<RecetasProvider>().seleccionar(planta);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChangeNotifierProvider.value(
                      value: context.read<RecetasProvider>(),
                      child: const DetalleRecetaScreen(),
                    ),
                  ),
                );
              },
            );
          },
        );

      default:
        return const SizedBox();
    }
  }
}
