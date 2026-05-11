import 'package:flutter/material.dart';

import '../perfil/perfil_screen.dart';
import '../favoritos/favoritos_screen.dart';
import '../plantas/lista_plantas_screen.dart';

import 'home_content_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeContent(),
    ListaPlantasScreen(),
    FavoritosScreen(),
    PerfilScreen(),
  ];

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
              color: Colors.black12,
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
                icon: Icon(Icons.search),
                label: 'Buscar',
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