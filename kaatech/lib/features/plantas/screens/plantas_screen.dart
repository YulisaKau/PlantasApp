import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/planta_model.dart';
import '../models/categoria_model.dart';
import '../widgets/plant_card.dart';
import '../widgets/explorar_card.dart';
import '../widgets/rutina_card.dart';
import '../../rutinas/rutina_model.dart';
import '../../rutinas/screens/rutina_detalle_screen.dart';
import '../../../features/auth/providers/auth_provider.dart';
import 'detalle_planta_screen.dart';
import 'lista_plantas_screen.dart';
import '../../recetas/screens/recetas_screen.dart';

class PlantasScreen extends StatefulWidget {
  const PlantasScreen({super.key});

  @override
  State<PlantasScreen> createState() => _PlantasScreenState();
}

class _PlantasScreenState extends State<PlantasScreen> {
  List<Planta> plantasFiltradas = plantas;

  void buscarPlanta(String texto) {
    setState(() {
      plantasFiltradas = plantas
          .where((p) => p.nombre.toLowerCase().contains(texto.toLowerCase()))
          .toList();
    });
  }

  void filtrarNecesidad(String necesidad) {
    setState(() {
      plantasFiltradas = plantas
          .where(
            (p) =>
                p.sintomas.contains(necesidad) ||
                p.emociones.contains(necesidad),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Saludo ────────────────────
                Text(
                  "Hola, ${user?.name ?? 'Amig@'} 🌿",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 20),

                // ── Buscador ──────────────────
                TextField(
                  onChanged: buscarPlanta,
                  decoration: InputDecoration(
                    hintText: "Buscar planta...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // ── Planta del día ────────────
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/manzanilla.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.2),
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "🌿 Planta del día",
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Manzanilla",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Ideal para relajación y dolor estomacal",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DetallePlantaScreen(planta: plantas.first),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text("Ver más"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 35),

                // ── Explorar ──────────────────
                Text(
                  "Explorar",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...categorias.map(
                        (categoria) => ExplorarCard(
                          titulo: categoria.nombre,
                          descripcion: categoria.descripcion,
                          icono: categoria.icono,
                          color: categoria.color,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ListaPlantasScreen(
                                categoria: categoria.nombre,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ── Card Recetas ──────────────
                      ExplorarCard(
                        titulo: 'Recetas',
                        descripcion:
                            'Preparaciones y remedios naturales paso a paso',
                        icono: Icons.local_drink,
                        color: const Color(0xFF2D6A4F),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RecetasScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),

                // ── ¿Cómo te sientes? ─────────
                Text(
                  "¿Cómo te sientes hoy?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 55,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildNeedChip("😴 Insomnio", "Insomnio"),
                      _buildNeedChip("😰 Ansiedad", "Ansiedad"),
                      _buildNeedChip("🤧 Gripe", "Gripe"),
                      _buildNeedChip("🤢 Náuseas", "Náuseas"),
                      _buildNeedChip("⚡ Fatiga", "Fatiga"),
                    ],
                  ),
                ),
                const SizedBox(height: 35),

                // ── Plantas recomendadas ──────
                Text(
                  "Plantas recomendadas",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 190,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: plantasFiltradas
                        .map(
                          (planta) => PlantCard(
                            name: planta.nombre,
                            image: planta.imagen,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    DetallePlantaScreen(planta: planta),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 35),
                // ── Rutinas ───────────────────
                Text(
                  "Rutinas naturales",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: rutinas
                        .map(
                          (rutina) => RutinaCard(
                            titulo: rutina.titulo,
                            descripcion: rutina.descripcion,
                            emoji: rutina.emoji,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    RutinaDetalleScreen(rutina: rutina),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNeedChip(String texto, String necesidad) {
    return GestureDetector(
      onTap: () => filtrarNecesidad(necesidad),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          texto,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
