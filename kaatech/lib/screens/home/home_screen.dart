import 'package:flutter/material.dart';

import '../favoritos/favoritos_screen.dart';
import '../perfil/perfil_screen.dart';
import '../recetas/recetas_screen.dart';

import 'home_content_screen.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {

    super.initState();

    _screens = [

      const HomeContent(),

      const RecetasScreen(),

      const FavoritosScreen(),

      const PerfilScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _screens[_currentIndex],

      bottomNavigationBar: Container(

        margin: const EdgeInsets.all(12),

        decoration: BoxDecoration(

          color: Theme.of(context).cardColor,

          borderRadius: BorderRadius.circular(20),

          boxShadow: [

            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
            ),
          ],
        ),

        child: ClipRRect(

          borderRadius: BorderRadius.circular(20),

          child: BottomNavigationBar(

            currentIndex: _currentIndex,

            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.grey,

            backgroundColor:
                Theme.of(context).cardColor,

            type: BottomNavigationBarType.fixed,

            elevation: 0,

            onTap: (index) {

              setState(() {
                _currentIndex = index;
              });
            },

            items: const [

              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.local_drink),
                label: 'Recetas',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favoritos',
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}