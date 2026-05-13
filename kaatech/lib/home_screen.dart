import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_colors.dart';
import 'features/auth/providers/auth_provider.dart';
import 'features/plantas/screens/plantas_screen.dart';
import 'features/plantas/screens/favoritos_screen.dart';
import 'features/recetas/screens/recetas_screen.dart';
import 'features/perfil/perfil_screen.dart';
import 'features/admin/screens/admin_screen.dart';

const String _adminEmail = 'yulisakau6@gmail.com';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;
    final isAdmin = user?.email == _adminEmail;

    final screens = [
      const PlantasScreen(),
      const FavoritosScreen(),
      const RecetasScreen(),
      const PerfilScreen(),
      if (isAdmin) const AdminScreen(),
    ];

    final items = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.local_florist),
        label: 'Plantas',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favoritos',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.local_drink),
        label: 'Recetas',
      ),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      if (isAdmin)
        const BottomNavigationBarItem(
          icon: Icon(Icons.admin_panel_settings),
          label: 'Admin',
        ),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: items,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
