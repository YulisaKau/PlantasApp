class Rutina {
  final String titulo;
  final String descripcion;
  final String emoji;
  final List<String> plantas;
  final List<String> pasos;
  final String consejo;
  final String horario;
  final String duracion;

  Rutina({
    required this.titulo,
    required this.descripcion,
    required this.emoji,
    required this.plantas,
    required this.pasos,
    required this.consejo,
    required this.horario,
    required this.duracion,
  });
}

final List<Rutina> rutinas = [
  Rutina(
    titulo: "Dormir mejor",
    emoji: "😴",
    descripcion: "Rutina natural para relajarte y mejorar el sueño.",
    plantas: ["Lavanda", "Valeriana", "Tila"],
    pasos: [
      "Preparar una infusión relajante.",
      "Tomar 30 minutos antes de dormir.",
      "Evitar pantallas antes de acostarse.",
    ],
    consejo: "Mantén tu habitación fresca y oscura para mejorar el descanso.",
    horario: "9:00 PM",
    duracion: "5 días",
  ),
  Rutina(
    titulo: "Más energía",
    emoji: "⚡",
    descripcion: "Plantas ideales para combatir fatiga y cansancio.",
    plantas: ["Romero", "Ginseng"],
    pasos: [
      "Consumir té por la mañana.",
      "Mantener buena hidratación.",
      "Complementar con descanso adecuado.",
    ],
    consejo: "Evita consumir estas plantas antes de dormir.",
    horario: "8:00 AM",
    duracion: "7 días",
  ),
  Rutina(
    titulo: "Alivio respiratorio",
    emoji: "🤧",
    descripcion: "Ayuda natural para gripe y congestión.",
    plantas: ["Eucalipto", "Tomillo"],
    pasos: [
      "Preparar vapor con eucalipto.",
      "Tomar infusión caliente.",
      "Descansar correctamente.",
    ],
    consejo: "Mantente hidratado durante el día.",
    horario: "Mañana y noche",
    duracion: "3 días",
  ),
  Rutina(
    titulo: "Digestión saludable",
    emoji: "🤢",
    descripcion: "Ayuda a aliviar molestias digestivas.",
    plantas: ["Manzanilla", "Menta", "Hierbabuena"],
    pasos: [
      "Tomar infusión después de comer.",
      "Evitar alimentos irritantes.",
      "Descansar después de comer.",
    ],
    consejo: "Consumir lentamente para mejores resultados.",
    horario: "Después de comidas",
    duracion: "5 días",
  ),
];
