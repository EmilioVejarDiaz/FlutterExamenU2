import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:examen_u_2/modules/money_account/entities/control_cuentas.dart';
import 'package:examen_u_2/modules/money_account/widgets/custom_list_money_accounts.dart';
import 'package:examen_u_2/navigation/cuenta_detallada.dart';
import 'package:examen_u_2/navigation/registrar_gasto.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  bool _isLoading = true;
  List<Gastos> gastos = [];

  @override
  void initState() {
    super.initState();
    db.collection("control_cuentas").snapshots().listen((event) {
      gastos.clear();
      for (var doc in event.docs) {
        final gasto = Gastos.fromJson(doc.data());
        gastos.add(gasto);
      }
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: gastos.isNotEmpty
          ? ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: gastos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CuentaDetallada(gastos: gastos[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: CustomListCuentas(gastos: gastos[index]),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1,
                  color: Colors.grey,
                );
              },
            )
          : const Center(child: Text('No hay gastos registrados')),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegistrarGasto()),
            );
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.pink,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
