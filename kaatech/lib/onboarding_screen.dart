import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'features/auth/screens/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: [Color(0xFF0F2A14), Color(0xFF18361E), Color(0xFF1D4727)],
          ),
        ),

        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,

                  onPageChanged: (index) {
                    setState(() {
                      isLastPage = index == 2;
                    });
                  },

                  children: const [
                    OnboardPage(
                      icon: Icons.eco,
                      title: 'Descubre plantas medicinales',
                      description:
                          'Aprende propiedades naturales y beneficios para tu bienestar.',
                    ),

                    OnboardPage(
                      icon: Icons.favorite,
                      title: 'Guarda tus favoritas',
                      description:
                          'Crea una colección personalizada de plantas y remedios.',
                    ),

                    OnboardPage(
                      icon: Icons.spa,
                      title: 'Mejora tu bienestar',
                      description:
                          'Explora rutinas naturales para una vida más saludable.',
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 30,
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },

                      child: const Text(
                        'Saltar',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),

                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,

                      effect: const WormEffect(
                        dotColor: Colors.white24,
                        activeDotColor: Color(0xFFA4AD95),

                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),

                    isLastPage
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA4AD95),
                              foregroundColor: const Color(0xFF17381F),
                              minimumSize: const Size(110, 44),
                            ),

                            child: const Text('Comenzar'),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFA4AD95),
                              foregroundColor: const Color(0xFF17381F),
                              minimumSize: const Size(110, 44),
                            ),

                            child: const Text('Siguiente'),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const OnboardPage({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            height: 180,
            width: 180,

            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(40),
            ),

            child: Icon(icon, size: 90, color: const Color(0xFFA4AD95)),
          ),

          const SizedBox(height: 50),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFA4AD95),
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 17,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
