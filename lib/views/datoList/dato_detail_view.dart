import 'package:flutter/material.dart';
import 'package:servicio_satelital/widgets/navigation_drawer_menu.dart';
import 'package:servicio_satelital/models/dato.dart';


class DatoDetailView extends StatelessWidget {
  final Dato dato;

  const DatoDetailView({Key? key, required this.dato}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dato.name),
      ),
      drawer: NavigationDrawerMenu(), // Incluye el NavigationDrawerMenu
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ID: ${dato.id} - ${dato.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Descripción: ${dato.description}'),
            Text('Área: ${dato.area}'),
            Text('Fecha de Proceso: ${dato.dateProccess}'),
            const SizedBox(height: 10),
            Text('NDWI Link: ${dato.ndwiLink}'),
            Text('NDTI Link: ${dato.ndtiLink}'),
            Text('Path/Row SRC: ${dato.pathRowrc}'),
          ],
        ),
      ),
    );
  }
}
