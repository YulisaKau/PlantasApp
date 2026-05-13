import 'package:flutter/material.dart';

class ExplorarCard
    extends StatelessWidget {

  final String titulo;

  final String descripcion;

  final IconData icono;

  final Color color;

  final VoidCallback onTap;

  const ExplorarCard({

    super.key,

    required this.titulo,

    required this.descripcion,

    required this.icono,

    required this.color,

    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: onTap,

      child: Container(

        width: 260,

        height: 240,

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

            Container(

              padding:
                  const EdgeInsets.all(
                14,
              ),

              decoration:
                  BoxDecoration(

                color:
                    color.withOpacity(
                  0.15,
                ),

                borderRadius:
                    BorderRadius.circular(
                  18,
                ),
              ),

              child: Icon(

                icono,

                color: color,

                size: 30,
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

            Expanded(

              child: Text(

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

                maxLines: 4,

                overflow:
                    TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 12),

            Row(

              children: [

                Icon(
                  Icons.arrow_forward,
                  color: color,
                ),

                const SizedBox(width: 8),

                Text(

                  "Explorar",

                  style: TextStyle(

                    color: color,

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