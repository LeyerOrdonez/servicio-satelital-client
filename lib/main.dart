import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Agregar esta línea
import 'package:servicio_satelital/config/router/app_router.dart';
import 'package:servicio_satelital/config/router/theme/theme.dart';
import 'package:servicio_satelital/config/router/theme/theme_controller.dart'; // Agregar esta línea

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (_) => themeController, // Proveedor del controlador del tema
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);

    return MaterialApp.router(
      title: 'Servicio Satelital Uceva',
      theme: AppTheme.lightTheme, // Tema claro
      darkTheme: AppTheme.darkTheme, // Tema oscuro
      themeMode: themeController.themeMode, // Modo dinámico basado en ThemeController
      routerConfig: router,
    );
  }
}
