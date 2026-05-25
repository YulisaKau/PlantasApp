import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/kaatech_app_bar.dart';

class HerramientasScreen extends StatelessWidget {
  const HerramientasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF1A2E1F) : Colors.white;
    final borderColor = isDark ? const Color(0xFF2D4A35) : Colors.grey.shade100;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final mutedColor = Theme.of(
      context,
    ).colorScheme.onSurface.withValues(alpha: 0.6);
    final accentColor = isDark
        ? const Color(0xFF52B788)
        : AppColors.primaryMedium;

    return Scaffold(
      appBar: const KaatechAppBar(title: 'Herramientas'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Encabezado ─────────────────────
            Text(
              'Herramientas K\'aaxTech',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Próximamente disponibles para ti',
              style: TextStyle(fontSize: 14, color: mutedColor),
            ),
            const SizedBox(height: 28),

            // ── Card Chatbot ────────────────────
            _HerramientaCard(
              isDark: isDark,
              cardColor: cardColor,
              borderColor: borderColor,
              accentColor: accentColor,
              textColor: textColor,
              mutedColor: mutedColor,
              icono: Icons.smart_toy_outlined,
              titulo: 'Asistente K\'aaxTech',
              subtitulo: 'Chatbot inteligente',
              descripcion:
                  'Resuelve tus dudas sobre plantas medicinales en tiempo real. '
                  'Pregunta sobre propiedades, preparaciones, dosis y contraindicaciones. '
                  'Nuestro asistente está entrenado con información validada de fitoterapia.',
              chips: const [
                'Preguntas frecuentes',
                'Identificación',
                'Dosis',
                'Recetas',
              ],
              etiqueta: 'Próximamente',
              colorEtiqueta: Colors.orange,
            ),

            const SizedBox(height: 20),

            // ── Card Animación 2D ───────────────
            _HerramientaCard(
              isDark: isDark,
              cardColor: cardColor,
              borderColor: borderColor,
              accentColor: accentColor,
              textColor: textColor,
              mutedColor: mutedColor,
              icono: Icons.animation_outlined,
              titulo: 'Guía Animada',
              subtitulo: 'Animación 2D interactiva',
              descripcion:
                  'Aprende sobre plantas medicinales a través de una experiencia visual animada. '
                  'Una guía interactiva en 2D que te muestra propiedades y usos '
                  'de forma dinámica y entretenida.',
              chips: const ['Visual', 'Interactivo', 'Educativo', '2D'],
              etiqueta: 'En desarrollo',
              colorEtiqueta: Colors.blue,
            ),

            const SizedBox(height: 32),

            // ── Banner informativo ──────────────
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF1A2E1F) : AppColors.primaryPale,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: accentColor, size: 28),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '¿Tienes alguna sugerencia?',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Comparte tus ideas en la sección de Comunidad.',
                          style: TextStyle(fontSize: 13, color: mutedColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _HerramientaCard extends StatelessWidget {
  final bool isDark;
  final Color cardColor, borderColor, accentColor, textColor, mutedColor;
  final IconData icono;
  final String titulo, subtitulo, descripcion, etiqueta;
  final List<String> chips;
  final Color colorEtiqueta;

  const _HerramientaCard({
    required this.isDark,
    required this.cardColor,
    required this.borderColor,
    required this.accentColor,
    required this.textColor,
    required this.mutedColor,
    required this.icono,
    required this.titulo,
    required this.subtitulo,
    required this.descripcion,
    required this.chips,
    required this.etiqueta,
    required this.colorEtiqueta,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 10,
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Ícono + etiqueta
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icono, color: accentColor, size: 28),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: colorEtiqueta.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  etiqueta,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: colorEtiqueta,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Título
          Text(
            titulo,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitulo,
            style: TextStyle(
              fontSize: 13,
              color: accentColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),

          // Descripción
          Text(
            descripcion,
            style: TextStyle(fontSize: 13.5, color: mutedColor, height: 1.6),
          ),
          const SizedBox(height: 16),

          // Chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: chips
                .map(
                  (chip) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: accentColor.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      chip,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: accentColor,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
