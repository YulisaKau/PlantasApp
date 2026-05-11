import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favoritos_provider.dart';
import '../plantas/detalle_planta_screen.dart';

class FavoritosScreen extends StatelessWidget {

  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final favoritosProvider =
        Provider.of<FavoritosProvider>(context);

    final favoritos = favoritosProvider.favoritos;

    return Scaffold(

      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("Favoritos"),
        backgroundColor: Colors.green,
      ),

      body: favoritos.isEmpty

          ? Center(

              child: Text(
                "No tienes favoritos ❤️",

                style: TextStyle(
                  fontSize: 18,

                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color,
                ),
              ),
            )

          : ListView.builder(

              itemCount: favoritos.length,

              itemBuilder: (context, index) {

                final planta = favoritos[index];

                return Card(

                  color:
                      Theme.of(context).cardColor,

                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(18),
                  ),

                  child: ListTile(

                    contentPadding:
                        const EdgeInsets.all(10),

                    leading: ClipRRect(

                      borderRadius:
                          BorderRadius.circular(12),

                      child: Image.asset(
                        planta.imagen,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),

                    title: Text(
                      planta.nombre,

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    subtitle:
                        Text(planta.categoria),

                    trailing: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),

                    onTap: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (_) =>
                              DetallePlantaScreen(
                            planta: planta,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}