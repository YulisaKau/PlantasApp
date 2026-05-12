import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {

  final String name;
  final String image;
  final String time;
  final String benefit;
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.name,
    required this.image,
    required this.time,
    required this.benefit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        width: 230,

        margin: const EdgeInsets.only(right: 18),

        decoration: BoxDecoration(

          color: Theme.of(context).cardColor,

          borderRadius: BorderRadius.circular(24),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // 🌿 imagen
            ClipRRect(

              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(24),
              ),

              child: Hero(

                tag: image,

                child: Image.asset(
                  image,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  // ☕ nombre
                  Text(

                    name,

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,

                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.color,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ⏱ tiempo
                  Row(

                    children: [

                      const Icon(
                        Icons.access_time,
                        color: Colors.green,
                        size: 18,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // 💚 beneficio
                  Row(

                    children: [

                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        benefit,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}