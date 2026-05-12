class Receta {

  final String nombre;
  final String imagen;
  final String descripcion;
  final String tiempo;
  final String beneficio;

  Receta({

    required this.nombre,
    required this.imagen,
    required this.descripcion,
    required this.tiempo,
    required this.beneficio,
  });
}

final List<Receta> recetas = [

  Receta(

    nombre: "Té de Manzanilla",

    imagen:
        "assets/images/manzanilla.jpg",

    descripcion:
        "Infusión relajante ideal para el estrés y dolor estomacal.",

    tiempo: "10 min",

    beneficio: "Relajante",
  ),

  Receta(

    nombre: "Té de Hierbabuena",

    imagen:
        "assets/images/hierbabuena.jpg",

    descripcion:
        "Ayuda a la digestión y alivia malestares estomacales.",

    tiempo: "8 min",

    beneficio: "Digestivo",
  ),

  Receta(

    nombre: "Infusión de Jengibre",

    imagen:
        "assets/images/jengibre.jpg",

    descripcion:
        "Excelente para gripe, garganta y defensas.",

    tiempo: "15 min",

    beneficio: "Inmunidad",
  ),
];