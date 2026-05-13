import 'package:flutter/material.dart';

class Planta {
  final String nombre;
  final String imagen;
  final String descripcion;
  final String beneficios;
  final String preparacion;
  final String categoria;

  Planta({
    required this.nombre,
    required this.imagen,
    required this.descripcion,
    required this.beneficios,
    required this.preparacion,
    required this.categoria,
  });
}

// 🌿 LISTA DE PLANTAS
final List<Planta> plantas = [
  Planta(
    nombre: "Manzanilla",
    imagen: "assets/images/manzanilla.jpg",
    categoria: "Digestivas",
    descripcion:
        "La manzanilla es una planta medicinal muy utilizada para aliviar molestias estomacales y ayudar a relajar el cuerpo.",
    beneficios:
        "• Ayuda a la digestión\n"
        "• Reduce dolores estomacales\n"
        "• Ayuda a relajarse\n"
        "• Puede mejorar el sueño",
    preparacion:
        "Hierve una taza de agua y agrega flores de manzanilla. "
        "Déjala reposar de 5 a 10 minutos antes de beber.",
  ),
  Planta(
    nombre: "Sábila",
    imagen: "assets/images/sabila.jpg",
    categoria: "Cuidado de la piel",
    descripcion:
        "La sábila, también conocida como aloe vera, es famosa por sus propiedades refrescantes y regenerativas.",
    beneficios:
        "• Ayuda a cicatrizar\n"
        "• Refresca quemaduras\n"
        "• Hidrata la piel\n"
        "• Puede aliviar irritaciones",
    preparacion:
        "Extrae el gel de la sábila y aplícalo directamente sobre la piel o mezcla en bebidas naturales.",
  ),
  Planta(
    nombre: "Hierbabuena",
    imagen: "assets/images/hierbabuena.jpg",
    categoria: "Relajantes",
    descripcion:
        "La hierbabuena es una planta aromática utilizada para aliviar problemas digestivos y proporcionar sensación de frescura.",
    beneficios:
        "• Reduce náuseas\n"
        "• Ayuda a la digestión\n"
        "• Refresca el aliento\n"
        "• Relaja el cuerpo",
    preparacion:
        "Hierve hojas frescas en agua durante algunos minutos y sirve caliente como infusión.",
  ),
];
