import 'package:flutter/material.dart';

class PlantaModel {
  final String id;
  final String nombre;
  final String nombreCientifico;
  final String emoji;
  final String descripcion;
  final String usos;
  final String preparacion;
  final Color color;
  final double hidratacion;
  final double nutrientes;
  final double temperatura;

  const PlantaModel({
    required this.id,
    required this.nombre,
    required this.nombreCientifico,
    required this.emoji,
    required this.descripcion,
    required this.usos,
    required this.preparacion,
    required this.color,
    this.hidratacion = 0.75,
    this.nutrientes = 0.60,
    this.temperatura = 0.85,
  });

  factory PlantaModel.fromMap(Map<String, dynamic> map, String id) {
    return PlantaModel(
      id: id,
      nombre: map['nombre'] ?? '',
      nombreCientifico: map['nombreCientifico'] ?? '',
      emoji: map['emoji'] ?? '🌿',
      descripcion: map['descripcion'] ?? '',
      usos: map['usos'] ?? '',
      preparacion: map['preparacion'] ?? '',
      color: Color(map['color'] ?? 0xFF2D6A4F),
      hidratacion: (map['hidratacion'] ?? 0.75).toDouble(),
      nutrientes: (map['nutrientes'] ?? 0.60).toDouble(),
      temperatura: (map['temperatura'] ?? 0.85).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'nombreCientifico': nombreCientifico,
      'emoji': emoji,
      'descripcion': descripcion,
      'usos': usos,
      'preparacion': preparacion,
      'color': color.value,
      'hidratacion': hidratacion,
      'nutrientes': nutrientes,
      'temperatura': temperatura,
    };
  }
}
