import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/kaatech_app_bar.dart';

class ComunidadScreen extends StatelessWidget {
  const ComunidadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: const KaatechAppBar(title: 'Comunidad'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF1A2E1F)
                      : AppColors.primaryPale,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.groups_2_outlined,
                  size: 52,
                  color: isDark
                      ? const Color(0xFF52B788)
                      : AppColors.primaryMedium,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Comunidad K\'AAXTECH',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Próximamente podrás conectarte con otros usuarios, '
                'compartir experiencias y consultar con expertos en plantas medicinales.',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.6),
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Chips de funciones que vendrán
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: const [
                  _FeatureChip(icon: Icons.forum_outlined, label: 'Foro'),
                  _FeatureChip(
                    icon: Icons.verified_outlined,
                    label: 'Expertos',
                  ),
                  _FeatureChip(
                    icon: Icons.rate_review_outlined,
                    label: 'Reseñas',
                  ),
                  _FeatureChip(
                    icon: Icons.menu_book_outlined,
                    label: 'Recetas',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FeatureChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A2E1F) : AppColors.primaryPale,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? const Color(0xFF2D4A35)
              : AppColors.primaryLight.withValues(alpha: 0.4),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isDark ? const Color(0xFF52B788) : AppColors.primaryMedium,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isDark ? const Color(0xFF52B788) : AppColors.primaryMedium,
            ),
          ),
        ],
      ),
    );
  }
}
