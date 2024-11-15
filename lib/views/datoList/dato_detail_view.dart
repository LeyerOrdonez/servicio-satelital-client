import 'package:flutter/material.dart';
import 'package:servicio_satelital/widgets/navigation_drawer_menu.dart';
import 'package:servicio_satelital/models/dato.dart';

class DatoDetailView extends StatelessWidget {
  final Dato dato;

  const DatoDetailView({super.key, required this.dato});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dato.name),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back), // Icono de regreso
        onPressed: () {
          Navigator.of(context).pop(); // Vuelve a la pantalla anterior
        },
      ),
      ),
      drawer: const NavigationDrawerMenu(), // Incluye el NavigationDrawerMenu
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${dato.id} ----Nombre: ${dato.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Descripción: ${dato.description}'),
            Text('Área: ${dato.area}'),
            Text('Fecha de Proceso: ${dato.dateProccess}'),
            const SizedBox(height: 10),
            const Text('NDWI Image:'),

            Expanded(
            child: Image.network(
            dato.ndwiLink,
                  fit: BoxFit.contain,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Center(
                  child: Text(
                  'Error al cargar la imagen',
                  style: TextStyle(color: Colors.red),
                  ),
                  );
                  },
            ),
            ), 
            const Text('NDTI image:'),
            Expanded(
            child: Image.network(
            dato.ndtiLink,
                  fit: BoxFit.contain,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return const Center(
                  child: Text(
                  'Error al cargar la imagen',
                  style: TextStyle(color: Colors.red),
                  ),
                  );
                  },
            ),
            ), 
            
            Text('Path/Row SRC: ${dato.pathRowrc}'),

          ],
        ),
      ),
    );
  }
}
