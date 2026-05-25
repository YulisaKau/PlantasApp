import 'package:flutter/material.dart';

class Categoria {
  final String nombre;
  final String descripcion;
  final IconData icono;
  final Color color;

  Categoria({
    required this.nombre,
    required this.descripcion,
    required this.icono,
    required this.color,
  });
}

final List<Categoria> categorias = [
  Categoria(
    nombre: "Digestivas",
    descripcion:
        "Ayudan a aliviar molestias estomacales y mejorar la digestión.",
    icono: Icons.spa,
    color: Colors.green,
  ),
  Categoria(
    nombre: "Respiratorias",
    descripcion: "Ideales para aliviar gripe, tos y congestión.",
    icono: Icons.air,
    color: Colors.lightBlue,
  ),
  Categoria(
    nombre: "Relajantes",
    descripcion: "Ayudan a reducir estrés, ansiedad e insomnio.",
    icono: Icons.self_improvement,
    color: Colors.purple,
  ),
  Categoria(
    nombre: "Energéticas",
    descripcion: "Ayudan a combatir fatiga y mejorar energía.",
    icono: Icons.bolt,
    color: Colors.orange,
  ),
  Categoria(
    nombre: "Cuidado de la piel",
    descripcion: "Ayudan a hidratar, regenerar y cuidar la piel.",
    icono: Icons.favorite,
    color: Colors.pink,
  ),
];
