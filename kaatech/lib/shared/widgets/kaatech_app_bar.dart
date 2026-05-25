import 'package:flutter/material.dart';

/// AppBar con el logo de K'AATECH.
/// Usa Logo1 horizontal — versión clara en light mode, oscura en dark mode.
/// Úsalo así:
///   appBar: const KaatechAppBar(),
///   appBar: const KaatechAppBar(actions: [...]),
///   appBar: KaatechAppBar(title: 'Título personalizado'),
class KaatechAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final bool showBack;
  final String? title; // Si lo pones, muestra texto en lugar del logo

  const KaatechAppBar({
    super.key,
    this.actions,
    this.showBack = false,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      automaticallyImplyLeading: showBack,
      title: title != null
          ? Text(title!)
          : Image.asset(
              isDark
                  ? 'assets/imagesApp/K_aaxTech/DarkMode/Logo1Drk.png'
                  : 'assets/imagesApp/K_aaxTech/LightMode/Logo1.png',
              height: 28,
              // Logo1 negro en light se invierte a blanco para el AppBar verde
              color: isDark ? null : Colors.white,
              colorBlendMode: isDark ? null : BlendMode.srcIn,
              errorBuilder: (_, __, ___) => Text(
                "K'AATECH",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
      actions: actions,
    );
  }
}
