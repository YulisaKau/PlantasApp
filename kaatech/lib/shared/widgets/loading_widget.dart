import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  final String? mensaje;

  const LoadingWidget({super.key, this.mensaje});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            color: AppColors.primaryMedium,
            strokeWidth: 3,
          ),
          if (mensaje != null) ...[
            const SizedBox(height: 16),
            Text(
              mensaje!,
              style: const TextStyle(color: AppColors.textSoft, fontSize: 14),
            ),
          ],
        ],
      ),
    );
  }
}
