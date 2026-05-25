class Planta {
  final String nombre;
  final String imagen;
  final String descripcion;
  final String beneficios;
  final String preparacion;
  final String categoria;
  final String origen;
  final List<String> sintomas;
  final String tipoConsumo;
  final String frecuencia;
  final String contraindicaciones;
  final String propiedades;
  final int popularidad;
  final List<String> emociones;

  Planta({
    required this.nombre,
    required this.imagen,
    required this.descripcion,
    required this.beneficios,
    required this.preparacion,
    required this.categoria,
    required this.origen,
    required this.sintomas,
    required this.tipoConsumo,
    required this.frecuencia,
    required this.contraindicaciones,
    required this.propiedades,
    required this.popularidad,
    required this.emociones,
  });
}

// 🌿 LISTA DE PLANTAS
final List<Planta> plantas = [
  Planta(
    nombre: "Manzanilla",
    imagen: "assets/images/manzanilla.jpg",
    categoria: "Digestivas",
    descripcion:
        "La manzanilla es una planta medicinal muy utilizada para aliviar molestias estomacales y ayudar a relajar el cuerpo.",
    beneficios:
        "• Ayuda a la digestión\n• Reduce dolores estomacales\n• Ayuda a relajarse\n• Puede mejorar el sueño",
    preparacion:
        "Hierve una taza de agua y agrega flores de manzanilla. Déjala reposar de 5 a 10 minutos antes de beber.",
    origen: "Europa",
    sintomas: ["Estrés", "Dolor estomacal", "Ansiedad", "Insomnio"],
    tipoConsumo: "Infusión",
    frecuencia: "1 a 2 veces al día",
    contraindicaciones: "Evitar en personas alérgicas a flores tipo margarita.",
    propiedades: "Antiinflamatoria y relajante.",
    popularidad: 5,
    emociones: ["Relajación", "Calma"],
  ),
  Planta(
    nombre: "Sábila",
    imagen: "assets/images/sabila.jpg",
    categoria: "Cuidado de la piel",
    descripcion:
        "La sábila, también conocida como aloe vera, ayuda a hidratar y regenerar la piel.",
    beneficios:
        "• Hidrata piel\n• Ayuda a cicatrizar\n• Refresca quemaduras\n• Reduce irritaciones",
    preparacion: "Extraer gel y aplicar directamente.",
    origen: "África",
    sintomas: ["Quemaduras", "Irritación", "Piel seca"],
    tipoConsumo: "Uso tópico",
    frecuencia: "Uso moderado",
    contraindicaciones: "Evitar consumo excesivo oral.",
    propiedades: "Regeneradora e hidratante.",
    popularidad: 5,
    emociones: ["Alivio", "Bienestar"],
  ),
  Planta(
    nombre: "Hierbabuena",
    imagen: "assets/images/hierbabuena.jpg",
    categoria: "Digestivas",
    descripcion:
        "La hierbabuena ayuda a aliviar molestias digestivas y brinda sensación refrescante.",
    beneficios:
        "• Reduce náuseas\n• Ayuda a la digestión\n• Refresca el aliento\n• Relaja el cuerpo",
    preparacion: "Hervir hojas frescas y servir caliente.",
    origen: "Europa",
    sintomas: ["Náuseas", "Dolor estomacal", "Indigestión"],
    tipoConsumo: "Infusión",
    frecuencia: "Después de comidas",
    contraindicaciones: "Evitar exceso en gastritis severa.",
    propiedades: "Digestiva y refrescante.",
    popularidad: 4,
    emociones: ["Alivio", "Frescura"],
  ),
  Planta(
    nombre: "Lavanda",
    imagen: "assets/images/lavanda.jpg",
    categoria: "Relajantes",
    descripcion:
        "La lavanda ayuda a reducir el estrés, mejorar el sueño y brindar sensación de tranquilidad.",
    beneficios:
        "• Reduce ansiedad\n• Ayuda a dormir\n• Relaja el cuerpo\n• Reduce estrés",
    preparacion:
        "Preparar en infusión durante 10 minutos o usar en aromaterapia.",
    origen: "Mediterráneo",
    sintomas: ["Estrés", "Ansiedad", "Insomnio"],
    tipoConsumo: "Infusión y aromaterapia",
    frecuencia: "Antes de dormir",
    contraindicaciones: "Evitar consumo excesivo durante embarazo.",
    propiedades: "Relajante y calmante natural.",
    popularidad: 5,
    emociones: ["Calma", "Relajación", "Sueño"],
  ),
  Planta(
    nombre: "Eucalipto",
    imagen: "assets/images/eucalipto.jpg",
    categoria: "Respiratorias",
    descripcion:
        "El eucalipto es excelente para aliviar problemas respiratorios y congestión nasal.",
    beneficios:
        "• Ayuda a respirar mejor\n• Reduce congestión\n• Ayuda con gripe\n• Refresca vías respiratorias",
    preparacion: "Hervir hojas y utilizar el vapor o preparar infusión.",
    origen: "Australia",
    sintomas: ["Gripe", "Congestión", "Tos"],
    tipoConsumo: "Vaporización e infusión",
    frecuencia: "2 veces al día",
    contraindicaciones: "Evitar exceso en niños pequeños.",
    propiedades: "Descongestionante y refrescante.",
    popularidad: 5,
    emociones: ["Alivio", "Bienestar"],
  ),
  Planta(
    nombre: "Romero",
    imagen: "assets/images/romero.jpg",
    categoria: "Energéticas",
    descripcion:
        "El romero ayuda a mejorar la memoria y estimular la circulación.",
    beneficios:
        "• Mejora memoria\n• Ayuda concentración\n• Estimula circulación\n• Brinda energía",
    preparacion: "Consumir en té o infusión.",
    origen: "Mediterráneo",
    sintomas: ["Cansancio", "Falta de concentración", "Fatiga"],
    tipoConsumo: "Infusión",
    frecuencia: "Por las mañanas",
    contraindicaciones: "Evitar exceso en hipertensión.",
    propiedades: "Estimulante y antioxidante.",
    popularidad: 5,
    emociones: ["Motivación", "Concentración"],
  ),
  Planta(
    nombre: "Valeriana",
    imagen: "assets/images/valeriana.jpg",
    categoria: "Relajantes",
    descripcion:
        "La valeriana es una planta medicinal utilizada para combatir el insomnio y reducir la ansiedad.",
    beneficios:
        "• Ayuda a dormir\n• Reduce ansiedad\n• Relaja el sistema nervioso\n• Disminuye estrés",
    preparacion: "Preparar en infusión y consumir antes de dormir.",
    origen: "Europa y Asia",
    sintomas: ["Insomnio", "Ansiedad", "Estrés"],
    tipoConsumo: "Infusión",
    frecuencia: "1 vez antes de dormir",
    contraindicaciones: "No combinar con medicamentos sedantes.",
    propiedades: "Sedante y relajante natural.",
    popularidad: 4,
    emociones: ["Calma", "Sueño", "Relajación"],
  ),
  Planta(
    nombre: "Tila",
    imagen: "assets/images/tila.jpg",
    categoria: "Relajantes",
    descripcion:
        "La tila ayuda a tranquilizar el cuerpo y reducir los nervios.",
    beneficios:
        "• Reduce estrés\n• Ayuda a relajarse\n• Puede mejorar el sueño\n• Calma nervios",
    preparacion: "Tomar caliente en infusión antes de dormir.",
    origen: "Europa",
    sintomas: ["Estrés", "Nervios", "Insomnio"],
    tipoConsumo: "Infusión",
    frecuencia: "1 o 2 veces al día",
    contraindicaciones: "Evitar consumo excesivo.",
    propiedades: "Relajante y calmante.",
    popularidad: 4,
    emociones: ["Relajación", "Calma"],
  ),
  Planta(
    nombre: "Canela",
    imagen: "assets/images/canela.jpg",
    categoria: "Digestivas",
    descripcion:
        "La canela es utilizada para mejorar la digestión y estimular la circulación.",
    beneficios:
        "• Mejora digestión\n• Ayuda a la circulación\n• Tiene antioxidantes\n• Brinda energía",
    preparacion: "Hervir ramas de canela en agua durante 10 minutos.",
    origen: "Asia",
    sintomas: ["Indigestión", "Fatiga", "Frío"],
    tipoConsumo: "Infusión",
    frecuencia: "1 vez al día",
    contraindicaciones: "Evitar exceso durante embarazo.",
    propiedades: "Antioxidante y estimulante.",
    popularidad: 4,
    emociones: ["Energía", "Bienestar"],
  ),
  Planta(
    nombre: "Menta",
    imagen: "assets/images/menta.jpg",
    categoria: "Digestivas",
    descripcion:
        "La menta ayuda a aliviar molestias digestivas y proporciona frescura.",
    beneficios:
        "• Reduce náuseas\n• Ayuda a la digestión\n• Refresca el aliento\n• Disminuye dolor estomacal",
    preparacion: "Preparar en infusión con hojas frescas.",
    origen: "Europa y Asia",
    sintomas: ["Náuseas", "Dolor estomacal", "Indigestión"],
    tipoConsumo: "Infusión",
    frecuencia: "Después de comidas",
    contraindicaciones: "Evitar exceso en personas con gastritis severa.",
    propiedades: "Digestiva y refrescante.",
    popularidad: 5,
    emociones: ["Alivio", "Frescura"],
  ),
  Planta(
    nombre: "Ginseng",
    imagen: "assets/images/gingseng.jpg",
    categoria: "Energéticas",
    descripcion:
        "El ginseng ayuda a mejorar energía, concentración y rendimiento físico.",
    beneficios:
        "• Combate fatiga\n• Mejora concentración\n• Aumenta energía\n• Reduce cansancio",
    preparacion: "Consumir en té o infusión.",
    origen: "Asia",
    sintomas: ["Fatiga", "Cansancio", "Falta de concentración"],
    tipoConsumo: "Infusión",
    frecuencia: "Por las mañanas",
    contraindicaciones: "Evitar en hipertensión sin supervisión.",
    propiedades: "Energizante natural.",
    popularidad: 5,
    emociones: ["Motivación", "Energía"],
  ),
  Planta(
    nombre: "Tomillo",
    imagen: "assets/images/tomillo.jpg",
    categoria: "Respiratorias",
    descripcion: "El tomillo ayuda a aliviar tos y molestias respiratorias.",
    beneficios:
        "• Ayuda con la tos\n• Alivia garganta\n• Ayuda a respirar mejor\n• Refuerza defensas",
    preparacion: "Preparar en infusión caliente.",
    origen: "Mediterráneo",
    sintomas: ["Tos", "Gripe", "Dolor de garganta"],
    tipoConsumo: "Infusión",
    frecuencia: "2 veces al día",
    contraindicaciones: "Evitar exceso prolongado.",
    propiedades: "Antibacteriana y expectorante.",
    popularidad: 4,
    emociones: ["Alivio", "Bienestar"],
  ),
  Planta(
    nombre: "Caléndula",
    imagen: "assets/images/calendula.jpg",
    categoria: "Cuidado de la piel",
    descripcion:
        "La caléndula es utilizada para aliviar irritaciones y cuidar la piel.",
    beneficios:
        "• Ayuda a cicatrizar\n• Reduce inflamación\n• Cuida la piel\n• Alivia irritaciones",
    preparacion: "Aplicar en crema o consumir en té.",
    origen: "Mediterráneo",
    sintomas: ["Irritación", "Inflamación", "Heridas leves"],
    tipoConsumo: "Té y uso tópico",
    frecuencia: "Uso moderado",
    contraindicaciones: "Evitar en alergias a flores.",
    propiedades: "Antiinflamatoria y cicatrizante.",
    popularidad: 4,
    emociones: ["Bienestar", "Alivio"],
  ),
];
