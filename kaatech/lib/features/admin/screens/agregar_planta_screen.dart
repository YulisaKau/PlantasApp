import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_input.dart';

class AgregarPlantaScreen extends StatefulWidget {
  const AgregarPlantaScreen({super.key});

  @override
  State<AgregarPlantaScreen> createState() => _AgregarPlantaScreenState();
}

class _AgregarPlantaScreenState extends State<AgregarPlantaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _nombreCientificoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _beneficiosController = TextEditingController();
  final _preparacionController = TextEditingController();

  String _categoriaSeleccionada = 'Digestivas';
  bool _isLoading = false;

  final List<String> _categorias = [
    'Digestivas',
    'Respiratorias',
    'Urinarias',
    'Circulatorias',
    'Relajantes',
    'Cuidado de la piel',
  ];

  @override
  void dispose() {
    _nombreController.dispose();
    _nombreCientificoController.dispose();
    _descripcionController.dispose();
    _beneficiosController.dispose();
    _preparacionController.dispose();
    super.dispose();
  }

  Future<void> _guardarPlanta() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await FirebaseFirestore.instance.collection('plantas').add({
        'nombre': _nombreController.text.trim(),
        'nombreCientifico': _nombreCientificoController.text.trim(),
        'descripcion': _descripcionController.text.trim(),
        'beneficios': _beneficiosController.text.trim(),
        'preparacion': _preparacionController.text.trim(),
        'categoria': _categoriaSeleccionada,
        'imagen': 'assets/images/default.jpg',
        'createdAt': DateTime.now().toIso8601String(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Planta agregada correctamente'),
            backgroundColor: AppColors.success,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('❌ Error al guardar la planta'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Agregar Planta')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Nombre
              CustomInput(
                label: 'Nombre de la planta',
                controller: _nombreController,
                prefixIcon: Icons.local_florist,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.fieldRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Nombre científico
              CustomInput(
                label: 'Nombre científico',
                controller: _nombreCientificoController,
                prefixIcon: Icons.science_outlined,
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.fieldRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Categoría
              const Text(
                'Categoría',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSoft,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _categoriaSeleccionada,
                    isExpanded: true,
                    items: _categorias.map((cat) {
                      return DropdownMenuItem(value: cat, child: Text(cat));
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _categoriaSeleccionada = value);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Descripción
              TextFormField(
                controller: _descripcionController,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  prefixIcon: const Icon(Icons.description_outlined),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.fieldRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Beneficios
              TextFormField(
                controller: _beneficiosController,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Beneficios',
                  prefixIcon: const Icon(Icons.healing_outlined),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.fieldRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 14),

              // Preparación
              TextFormField(
                controller: _preparacionController,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Preparación',
                  prefixIcon: const Icon(Icons.local_cafe_outlined),
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.fieldRequired;
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Botón guardar
              CustomButton(
                label: 'Guardar Planta',
                onPressed: _guardarPlanta,
                isLoading: _isLoading,
                icon: Icons.save_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
