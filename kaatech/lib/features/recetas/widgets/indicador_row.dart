import 'package:flutter/material.dart';

class IndicadorRow extends StatelessWidget {
  final String label;
  final double valor;
  final Color color;

  const IndicadorRow({
    super.key,
    required this.label,
    required this.valor,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // ── Etiqueta ─────────────────────────
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // ── Barra de progreso ─────────────────
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: valor,
              backgroundColor: Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8,
            ),
          ),
        ),
        const SizedBox(width: 8),

        // ── Porcentaje ────────────────────────
        Text(
          '${(valor * 100).toInt()}%',
          style: TextStyle(
            fontSize: 11,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
