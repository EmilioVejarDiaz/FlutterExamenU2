import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegistrarGasto extends StatefulWidget {
  const RegistrarGasto({super.key});

  @override
  State<RegistrarGasto> createState() => _RegistrarGastoState();
}

class _RegistrarGastoState extends State<RegistrarGasto> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cantidadController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _nombreGastoController = TextEditingController();

  @override
  void dispose() {
    _cantidadController.dispose();
    _descripcionController.dispose();
    _nombreGastoController.dispose();
    super.dispose();
  }

Future<void> _saveExpense() async {
  if (_formKey.currentState!.validate()) {

    final CollectionReference ref = FirebaseFirestore.instance.collection("control_cuentas");

    final Map<String, dynamic> gastoData = {
      "cantidad": int.parse(_cantidadController.text),
      "descripcion": _descripcionController.text,
      "nombre_gasto": _nombreGastoController.text,
    };

    try {

      await ref.add(gastoData);
      print("Gasto registrado en Firestore");
      Navigator.pop(context);
    } catch (e) {
      print("Error al registrar el gasto: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al guardar el gasto")),
      );
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrar Gasto"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreGastoController,
                decoration: const InputDecoration(labelText: 'Nombre del Gasto'),
                validator: (value) => value == null || value.isEmpty ? 'Por favor ingrese el nombre del gasto' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descripcionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) => value == null || value.isEmpty ? 'Por favor ingrese la descripción' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _cantidadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Cantidad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la cantidad';
                  } else if (int.tryParse(value) == null) {
                    return 'Ingrese un valor numérico';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text('Guardar Gasto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}