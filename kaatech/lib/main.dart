import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_screen.dart';

import 'providers/favoritos_provider.dart';
import 'providers/theme_provider.dart';

void main() {

  runApp(

    MultiProvider(

      providers: [

        ChangeNotifierProvider(
          create: (_) => FavoritosProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],

      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final themeProvider =
        Provider.of<ThemeProvider>(context);

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Plantas Medicinales',

      // 🌞 tema claro
      theme: ThemeData(

        brightness: Brightness.light,

        primarySwatch: Colors.green,

        scaffoldBackgroundColor:
            const Color(0xFFF1F8F4),
      ),

      // 🌙 tema oscuro
      darkTheme: ThemeData(

        brightness: Brightness.dark,

        primarySwatch: Colors.green,

        scaffoldBackgroundColor:
            const Color(0xFF121212),
      ),

      themeMode: themeProvider.themeMode,

      home: const HomeScreen(),
    );
  }
}