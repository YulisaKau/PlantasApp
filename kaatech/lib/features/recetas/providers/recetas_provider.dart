import 'package:flutter/material.dart';
import '../models/planta_model.dart';
import '../services/recetas_service.dart';

enum RecetasStatus { initial, loading, loaded, error }

class RecetasProvider extends ChangeNotifier {
  final RecetasService _service = RecetasService();

  RecetasStatus _status = RecetasStatus.initial;
  List<PlantaModel> _plantas = [];
  List<PlantaModel> _plantasFiltradas = [];
  PlantaModel? _seleccionada;
  String? _errorMessage;
  String _busqueda = '';

  RecetasStatus get status => _status;
  List<PlantaModel> get plantas => _plantasFiltradas;
  PlantaModel? get seleccionada => _seleccionada;
  String? get errorMessage => _errorMessage;

  // ── Cargar plantas ────────────────────────
  Future<void> cargarPlantas() async {
    if (_status == RecetasStatus.loading) return;
    _status = RecetasStatus.loading;
    notifyListeners();

    try {
      _plantas = await _service.getPlantas();
      _plantasFiltradas = _plantas;
      _status = RecetasStatus.loaded;
    } catch (e) {
      _errorMessage = 'Error al cargar las plantas';
      _status = RecetasStatus.error;
    }
    notifyListeners();
  }

  // ── Buscar plantas ────────────────────────
  void buscar(String query) {
    _busqueda = query.toLowerCase();
    if (_busqueda.isEmpty) {
      _plantasFiltradas = _plantas;
    } else {
      _plantasFiltradas = _plantas.where((p) {
        return p.nombre.toLowerCase().contains(_busqueda) ||
            p.usos.toLowerCase().contains(_busqueda) ||
            p.nombreCientifico.toLowerCase().contains(_busqueda);
      }).toList();
    }
    notifyListeners();
  }

  // ── Seleccionar planta ────────────────────
  void seleccionar(PlantaModel planta) {
    _seleccionada = planta;
    notifyListeners();
  }

  // ── Limpiar selección ─────────────────────
  void limpiarSeleccion() {
    _seleccionada = null;
    notifyListeners();
  }
}
