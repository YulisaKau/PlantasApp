import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/planta_model.dart';

class RecetasService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // ── Datos locales de ejemplo ──────────────
  static final List<PlantaModel> plantasLocales = [
    const PlantaModel(
      id: '1',
      nombre: 'Manzanilla',
      nombreCientifico: 'Matricaria chamomilla',
      emoji: '🌼',
      descripcion:
          'Flor relajante con propiedades antiinflamatorias y digestivas, ideal para el sistema nervioso.',
      usos: 'Digestión · Ansiedad · Insomnio · Inflamación',
      preparacion:
          'Hervir 1 taza de agua y agregar 1 cucharada de flores secas. Reposar 10 minutos tapado. Colar y beber caliente.',
      color: Color(0xFFF5C842),
      hidratacion: 0.80,
      nutrientes: 0.55,
      temperatura: 0.70,
    ),
    const PlantaModel(
      id: '2',
      nombre: 'Albahaca',
      nombreCientifico: 'Ocimum basilicum',
      emoji: '🌿',
      descripcion:
          'Hierba aromática con propiedades antibacterianas y digestivas, ampliamente usada en medicina tradicional.',
      usos: 'Digestión · Estrés · Dolor de cabeza · Antibacterial',
      preparacion:
          'Machacar 5 hojas frescas en una taza. Verter agua caliente (no hirviendo). Reposar 8 minutos. Endulzar con miel.',
      color: Color(0xFF52B788),
      hidratacion: 0.90,
      nutrientes: 0.70,
      temperatura: 0.65,
    ),
    const PlantaModel(
      id: '3',
      nombre: 'Romero',
      nombreCientifico: 'Salvia rosmarinus',
      emoji: '🌱',
      descripcion:
          'Planta estimulante que mejora la circulación sanguínea, la memoria y el estado de ánimo.',
      usos: 'Circulación · Memoria · Dolor muscular · Cabello',
      preparacion:
          'Agregar 2 ramas frescas o 1 cucharada seca a 2 tazas de agua. Hervir 5 minutos. Reposar 10 minutos y colar.',
      color: Color(0xFF2D6A4F),
      hidratacion: 0.65,
      nutrientes: 0.80,
      temperatura: 0.90,
    ),
    const PlantaModel(
      id: '4',
      nombre: 'Lavanda',
      nombreCientifico: 'Lavandula angustifolia',
      emoji: '💜',
      descripcion:
          'Flor calmante ideal para reducir el estrés, mejorar el sueño y tratar problemas de piel.',
      usos: 'Insomnio · Ansiedad · Piel · Dolor de cabeza',
      preparacion:
          'Poner 1 cucharadita de flores secas en una taza. Verter agua a 90°C. Tapar y reposar 7 minutos. Colar y beber.',
      color: Color(0xFF9B72CF),
      hidratacion: 0.75,
      nutrientes: 0.50,
      temperatura: 0.60,
    ),
    const PlantaModel(
      id: '5',
      nombre: 'Jengibre',
      nombreCientifico: 'Zingiber officinale',
      emoji: '🫚',
      descripcion:
          'Raíz con potente efecto antiinflamatorio, digestivo e inmunoestimulante. Excelente para el frío.',
      usos: 'Náuseas · Digestión · Inflamación · Inmunidad',
      preparacion:
          'Pelar y cortar 3 rodajas de jengibre fresco. Hervir en 2 tazas de agua por 10 minutos. Agregar limón y miel al gusto.',
      color: Color(0xFFE07B39),
      hidratacion: 0.70,
      nutrientes: 0.85,
      temperatura: 0.95,
    ),
  ];

  // ── Obtener plantas desde Firestore ───────
  Future<List<PlantaModel>> getPlantas() async {
    try {
      final snapshot = await _firestore.collection('plantas').get();
      if (snapshot.docs.isEmpty) return plantasLocales;
      return snapshot.docs
          .map((doc) => PlantaModel.fromMap(doc.data(), doc.id))
          .toList();
    } catch (e) {
      // Si falla Firestore, retorna datos locales
      return plantasLocales;
    }
  }

  // ── Guardar planta en Firestore ───────────
  Future<void> guardarPlanta(PlantaModel planta) async {
    await _firestore.collection('plantas').doc(planta.id).set(planta.toMap());
  }
}
