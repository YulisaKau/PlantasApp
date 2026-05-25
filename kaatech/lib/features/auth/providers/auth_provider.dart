import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../../../core/constants/app_strings.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  AuthStatus _status = AuthStatus.initial;
  UserModel? _user;
  String? _errorMessage;

  AuthStatus get status => _status;
  UserModel? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  AuthProvider() {
    _authService.authStateChanges.listen((User? firebaseUser) async {
      if (firebaseUser != null) {
        // Cargar datos del usuario desde Firestore
        try {
          _user = await _authService.getUserFromFirestore(firebaseUser.uid);
        } catch (_) {
          // Si falla Firestore, crear UserModel básico con datos de Firebase
          _user = UserModel(
            uid: firebaseUser.uid,
            name:
                firebaseUser.displayName ??
                firebaseUser.email?.split('@').first ??
                'Usuario',
            email: firebaseUser.email ?? '',
            photoUrl: firebaseUser.photoURL,
            createdAt: DateTime.now(),
          );
        }
        _status = AuthStatus.authenticated;
      } else {
        _user = null;
        _status = AuthStatus.unauthenticated;
      }
      notifyListeners();
    });
  }

  // ── Registro con email ────────────────────
  Future<bool> register({
    required String name,
    required String email,
    required String password,
  }) async {
    _setLoading();
    try {
      _user = await _authService.registerWithEmail(
        name: name,
        email: email,
        password: password,
      );
      _status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _setError(_parseError(e.toString()));
      return false;
    }
  }

  // ── Login con email ───────────────────────
  Future<bool> login({required String email, required String password}) async {
    _setLoading();
    try {
      _user = await _authService.loginWithEmail(
        email: email,
        password: password,
      );
      _status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      _setError(_parseError(e.toString()));
      return false;
    }
  }

  // ── Login con Google ──────────────────────
  Future<bool> loginWithGoogle() async {
    _setLoading();
    try {
      _user = await _authService.loginWithGoogle();
      _status = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      final msg = e.toString();
      if (msg.contains('cancelado') ||
          msg.contains('canceled') ||
          msg.contains('cancelled')) {
        _status = AuthStatus.unauthenticated;
        notifyListeners();
        return false;
      }
      _setError(_parseError(msg));
      return false;
    }
  }

  // ── Cerrar sesión ─────────────────────────
  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  // ── Helpers privados ──────────────────────
  void _setLoading() {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();
  }

  void _setError(String message) {
    _status = AuthStatus.error;
    _errorMessage = message;
    notifyListeners();
  }

  String _parseError(String error) {
    if (error.contains('user-not-found')) return AppStrings.errorUserNotFound;
    if (error.contains('wrong-password')) return AppStrings.errorWrongPassword;
    if (error.contains('email-already-in-use'))
      return AppStrings.errorEmailInUse;
    if (error.contains('weak-password')) return AppStrings.errorWeakPassword;
    return AppStrings.errorGeneric;
  }
}
