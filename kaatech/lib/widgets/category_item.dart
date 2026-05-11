import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  const CategoryItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: AnimatedContainer(

        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),

        decoration: BoxDecoration(

          color: isSelected
              ? Colors.green
              : const Color(0xFFE8F5E9),

          borderRadius: BorderRadius.circular(18),

          boxShadow: [

            if (isSelected)

              BoxShadow(
                color: Colors.green.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
          ],
        ),

        child: Column(

          children: [

            Icon(
              icon,

              color: isSelected
                  ? Colors.white
                  : Colors.green,

              size: 28,
            ),

            const SizedBox(height: 8),

            Text(

              title,

              style: TextStyle(

                color: isSelected
                    ? Colors.white
                    : Colors.black,

                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}