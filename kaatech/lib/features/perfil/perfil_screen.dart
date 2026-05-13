import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../features/auth/providers/auth_provider.dart';
import '../../../features/plantas/models/planta_model.dart';
import '../../../features/plantas/providers/favoritos_provider.dart';
import '../../../features/plantas/providers/theme_provider.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritosProvider = Provider.of<FavoritosProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final totalFavoritos = favoritosProvider.favoritos.length;
    final user = authProvider.user;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // ── Avatar ────────────────────
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryPale,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 70,
                    color: AppColors.primaryMedium,
                  ),
                ),
                const SizedBox(height: 20),

                // ── Nombre ────────────────────
                Text(
                  user?.name ?? 'Usuario',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // ── Correo ────────────────────
                Text(
                  user?.email ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 35),

                // ── Estadísticas ──────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatCard(
                      context,
                      'Favoritos',
                      totalFavoritos.toString(),
                      Icons.favorite,
                    ),
                    _buildStatCard(
                      context,
                      'Plantas',
                      plantas.length.toString(),
                      Icons.local_florist,
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // ── Modo oscuro ───────────────
                Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: SwitchListTile(
                        value: themeProvider.isDarkMode,
                        onChanged: (_) => themeProvider.toggleTheme(),
                        secondary: const Icon(
                          Icons.dark_mode,
                          color: AppColors.primaryMedium,
                        ),
                        title: const Text('Modo oscuro'),
                      ),
                    );
                  },
                ),

                // ── Opciones ──────────────────
                _buildOption(
                  context: context,
                  icon: Icons.settings,
                  title: 'Configuración',
                  onTap: () {},
                ),
                _buildOption(
                  context: context,
                  icon: Icons.info,
                  title: 'Acerca de',
                  onTap: () {},
                ),
                _buildOption(
                  context: context,
                  icon: Icons.logout,
                  title: 'Cerrar sesión',
                  color: AppColors.error,
                  onTap: () async {
                    await context.read<AuthProvider>().signOut();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryMedium, size: 32),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: color ?? AppColors.primaryMedium),
        title: Text(title, style: TextStyle(color: color)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
      ),
    );
  }
}
