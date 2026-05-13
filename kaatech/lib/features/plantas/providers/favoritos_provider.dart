import 'package:flutter/material.dart';
import '../models/planta_model.dart';

class FavoritosProvider extends ChangeNotifier {
  // ❤️ lista favoritos
  final List<Planta> _favoritos = [];

  // getter
  List<Planta> get favoritos => _favoritos;

  // ❤️ agregar o quitar
  void toggleFavorito(Planta planta) {
    if (_favoritos.contains(planta)) {
      _favoritos.remove(planta);
    } else {
      _favoritos.add(planta);
    }
    notifyListeners();
  }

  // ❤️ verificar favorito
  bool esFavorito(Planta planta) {
    return _favoritos.contains(planta);
  }
}
