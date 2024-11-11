import 'package:flutter/material.dart';
import 'package:examen_u_2/modules/money_account/entities/control_cuentas.dart';

class CustomListCuentas extends StatelessWidget {
  const CustomListCuentas({
    super.key,
    required this.gastos,
  });

  final Gastos gastos;

  @override
  Widget build(BuildContext context) {
    Color getAlertColor() {
      if (gastos.cantidad >= 1000) {
        return Colors.red;
      } else if (gastos.cantidad >= 500) {
        return Colors.yellow;
      }
      return Colors.transparent;
    }

    String getAlertText() {
      if (gastos.cantidad >= 1000) {
        return 'Gasto Alto';
      } else if (gastos.cantidad >= 500) {
        return 'Cuidado';
      }
      return '';
    }

    return Row(
      children: [
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              gastos.nombre_gasto,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '\$${gastos.cantidad}',
              style: const TextStyle(fontSize: 14),
            ),
            Text(
              gastos.descripcion,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            if (getAlertText().isNotEmpty)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: getAlertColor(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  getAlertText(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
