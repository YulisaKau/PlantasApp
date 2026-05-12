import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

enum ButtonVariant { primary, outline, google }

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final bool isLoading;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = ButtonVariant.primary,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    switch (variant) {
      case ButtonVariant.primary:
        return _buildPrimary();
      case ButtonVariant.outline:
        return _buildOutline();
      case ButtonVariant.google:
        return _buildGoogle();
    }
  }

  // ── Botón primario verde ──────────────────
  Widget _buildPrimary() {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: _buildChild(Colors.white),
    );
  }

  // ── Botón outline ─────────────────────────
  Widget _buildOutline() {
    return OutlinedButton(
      onPressed: isLoading ? null : onPressed,
      child: _buildChild(AppColors.primaryMedium),
    );
  }

  // ── Botón Google ──────────────────────────
  Widget _buildGoogle() {
    return OutlinedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.g_mobiledata, size: 24),
      label: Text(label),
    );
  }

  // ── Contenido interno ─────────────────────
  Widget _buildChild(Color color) {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(color: color, strokeWidth: 2),
      );
    }
    if (icon != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(label),
        ],
      );
    }
    return Text(label);
  }
}
