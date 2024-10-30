import 'package:flutter/material.dart';
import 'package:servicio_satelital/config/router/app_router.dart';
import 'package:servicio_satelital/config/router/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Carga las variables de entorno
// Cambia esta URL a la que necesites
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Servicio Satelital Uceva',
      theme: AppTheme.lightTheme, // Aplicamos el tema claro
      darkTheme: AppTheme.darkTheme, // Aplicamos el tema oscuro (opcional)
      themeMode: ThemeMode.system, // El tema se adapta al modo del sistema
      routerConfig: router,
    );
  }
}
