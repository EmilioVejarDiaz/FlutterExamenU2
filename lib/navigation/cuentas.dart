import 'package:flutter/material.dart';

class Cuentas extends StatelessWidget {
  const Cuentas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuentas'),
      ),
       body: const Center(child: Text('Cuentas'),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/profile'),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // Propiedad correcta en el lugar correcto
     
    );
  }
}
