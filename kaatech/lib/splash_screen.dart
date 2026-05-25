import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/providers/auth_provider.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scaleAnim = Tween<double>(
      begin: 0.85,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
    _navigate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    AuthStatus status = context.read<AuthProvider>().status;
    if (status == AuthStatus.initial || status == AuthStatus.loading) {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      status = context.read<AuthProvider>().status;
    }

    if (status == AuthStatus.authenticated) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F2A14), Color(0xFF18361E), Color(0xFF1D4727)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ── Logo horizontal animado ──────
            FadeTransition(
              opacity: _fadeAnim,
              child: ScaleTransition(
                scale: _scaleAnim,
                child: Image.asset(
                  'assets/imagesApp/K_aaxTech/LightMode/Logo1.png',
                  width: 260,
                  // Logo1 es negro — necesita invertirse para verse en fondo oscuro
                  color: const Color(0xFFA4AD95),
                  colorBlendMode: BlendMode.srcIn,
                  errorBuilder: (_, __, ___) => const Text(
                    "K'AATECH",
                    style: TextStyle(
                      color: Color(0xFFA4AD95),
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 60),

            // ── Indicador de carga ───────────
            FadeTransition(
              opacity: _fadeAnim,
              child: const CircularProgressIndicator(
                color: Color(0xFFA4AD95),
                strokeWidth: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
