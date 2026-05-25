import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../../shared/widgets/kaatech_app_bar.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_input.dart';

class AgregarRecetaScreen extends StatefulWidget {
  final String? docId;
  final Map<String, dynamic>? datosIniciales;
  const AgregarRecetaScreen({super.key, this.docId, this.datosIniciales});

  @override
  State<AgregarRecetaScreen> createState() => _AgregarRecetaScreenState();
}

class _AgregarRecetaScreenState extends State<AgregarRecetaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _nombreCientificoController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _usosController = TextEditingController();
  final _preparacionController = TextEditingController();
  final _emojiController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final d = widget.datosIniciales;
    if (d != null) {
      _nombreController.text = d['nombre'] ?? '';
      _nombreCientificoController.text = d['nombreCientifico'] ?? '';
      _descripcionController.text = d['descripcion'] ?? '';
      _usosController.text = d['usos'] ?? '';
      _preparacionController.text = d['preparacion'] ?? '';
      _emojiController.text = d['emoji'] ?? '';
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _nombreCientificoController.dispose();
    _descripcionController.dispose();
    _usosController.dispose();
    _preparacionController.dispose();
    _emojiController.dispose();
    super.dispose();
  }

  Future<void> _guardarReceta() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final datos = {
        'nombre': _nombreController.text.trim(),
        'nombreCientifico': _nombreCientificoController.text.trim(),
        'descripcion': _descripcionController.text.trim(),
        'usos': _usosController.text.trim(),
        'preparacion': _preparacionController.text.trim(),
        'emoji': _emojiController.text.trim().isEmpty
            ? '🌿'
            : _emojiController.text.trim(),
        'color': 0xFF2D6A4F,
        'hidratacion': 0.75,
        'nutrientes': 0.60,
        'temperatura': 0.85,
        'createdAt': DateTime.now().toIso8601String(),
      };

      if (widget.docId != null) {
        await FirebaseFirestore.instance
            .collection('recetas')
            .doc(widget.docId)
            .update(datos);
      } else {
        await FirebaseFirestore.instance.collection('recetas').add(datos);
      }

      if (mounted) {
        final msg = widget.docId != null
            ? '✅ Receta actualizada correctamente'
            : '✅ Receta agregada correctamente';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: AppColors.success),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('❌ Error al guardar la receta'),
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: KaatechAppBar(
        title: widget.docId != null ? 'Editar Receta' : 'Agregar Receta',
        showBack: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Emoji
              CustomInput(
                label: 'Emoji representativo (ej: 🌼)',
                controller: _emojiController,
                prefixIcon: Icons.emoji_emotions_outlined,
              ),
              const SizedBox(height: 14),

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

              // Usos
              TextFormField(
                controller: _usosController,
                maxLines: 2,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Usos medicinales (ej: Digestión · Ansiedad)',
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
                maxLines: 4,
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
                label: 'Guardar Receta',
                onPressed: _guardarReceta,
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
