import 'package:flutter/material.dart';

class RutinaCard extends StatelessWidget {

  final String titulo;

  final String descripcion;

  final String emoji;

  final VoidCallback onTap;

  const RutinaCard({

    super.key,

    required this.titulo,

    required this.descripcion,

    required this.emoji,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        width: 240,

        margin:
            const EdgeInsets.only(
          right: 16,
        ),

        padding:
            const EdgeInsets.all(20),

        decoration: BoxDecoration(

          color:
              Theme.of(context)
                  .cardColor,

          borderRadius:
              BorderRadius.circular(
            28,
          ),

          boxShadow: [

            BoxShadow(

              color: Colors.black
                  .withOpacity(0.05),

              blurRadius: 10,
            ),
          ],
        ),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Text(

              emoji,

              style: const TextStyle(
                fontSize: 40,
              ),
            ),

            const SizedBox(height: 20),

            Text(

              titulo,

              style: TextStyle(

                fontSize: 22,

                fontWeight:
                    FontWeight.bold,

                color:
                    Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.color,
              ),
            ),

            const SizedBox(height: 10),

            Text(

              descripcion,

              style: TextStyle(

                fontSize: 15,

                height: 1.5,

                color:
                    Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color,
              ),
            ),

            const Spacer(),

            Row(

              children: const [

                Icon(
                  Icons.spa,
                  color: Colors.green,
                ),

                SizedBox(width: 8),

                Text(

                  "Ver rutina",

                  style: TextStyle(

                    color: Colors.green,

                    fontWeight:
                        FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}