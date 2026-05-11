import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/planta_model.dart';

import '../../providers/favoritos_provider.dart';
import '../../providers/theme_provider.dart';

class PerfilScreen extends StatelessWidget {

  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final favoritosProvider =
        Provider.of<FavoritosProvider>(context);

    final totalFavoritos =
        favoritosProvider.favoritos.length;

    return Scaffold(

      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor,

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.all(20),

            child: Column(

              children: [

                const SizedBox(height: 20),

                // 👤 avatar
                Container(

                  width: 120,
                  height: 120,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.shade100,
                  ),

                  child: const Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.green,
                  ),
                ),

                const SizedBox(height: 20),

                // 👤 nombre
                const Text(

                  "Alex",

                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // 📧 correo
                const Text(

                  "alex@email.com",

                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 35),

                // 📊 estadísticas
                Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,

                  children: [

                    _buildStatCard(
                      context,
                      "Favoritos",
                      totalFavoritos.toString(),
                      Icons.favorite,
                    ),

                    _buildStatCard(
                      context,
                      "Plantas",
                      plantas.length.toString(),
                      Icons.local_florist,
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // 🌙 modo oscuro
                Consumer<ThemeProvider>(

                  builder:
                      (context, themeProvider, child) {

                    return Container(

                      margin:
                          const EdgeInsets.only(
                        bottom: 16,
                      ),

                      decoration: BoxDecoration(

                        color: Theme.of(context)
                            .cardColor,

                        borderRadius:
                            BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.05),
                            blurRadius: 8,
                          ),
                        ],
                      ),

                      child: SwitchListTile(

                        value:
                            themeProvider.isDarkMode,

                        onChanged: (_) {

                          themeProvider
                              .toggleTheme();
                        },

                        secondary: const Icon(
                          Icons.dark_mode,
                          color: Colors.green,
                        ),

                        title:
                            const Text("Modo oscuro"),
                      ),
                    );
                  },
                ),

                // ⚙️ opciones
                _buildOption(
  context: context,
  icon: Icons.settings,
  title: "Configuración",
),

_buildOption(
  context: context,
  icon: Icons.info,
  title: "Acerca de",
),

_buildOption(
  context: context,
  icon: Icons.logout,
  title: "Cerrar sesión",
),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 📊 estadísticas
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
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
          ),
        ],
      ),

      child: Column(

        children: [

          Icon(
            icon,
            color: Colors.green,
            size: 32,
          ),

          const SizedBox(height: 12),

          Text(

            value,

            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  // ⚙️ opciones
  Widget _buildOption({

    required BuildContext context,
    required IconData icon,
    required String title,

  }) {

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

      child: ListTile(

        leading: Icon(
          icon,
          color: Colors.green,
        ),

        title: Text(title),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),
      ),
    );
  }
}