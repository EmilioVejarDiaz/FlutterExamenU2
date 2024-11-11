import 'package:examen_u_2/modules/auth/screens/create_account.dart';
import 'package:examen_u_2/modules/auth/screens/login.dart';
import 'package:examen_u_2/navigation/cuentas.dart';
import 'package:examen_u_2/navigation/home.dart';
import 'package:examen_u_2/navigation/navigation.dart';
import 'package:examen_u_2/navigation/profile.dart';
import 'package:examen_u_2/navigation/registrar_gasto.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error inicializando Firebase: $e');
  }
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const CreateAccount(),
        '/menu': (context) => const Navigation(),
        '/home': (context) => const Home(),
        '/cuentas': (context) => const Cuentas(),
        '/perfil': (context) => const Perfil(),
        '/registrarGasto': (context) => const RegistrarGasto(),
      },
    );
  }
}
