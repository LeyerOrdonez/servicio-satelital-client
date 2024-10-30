import 'package:flutter/material.dart';
import 'package:servicio_satelital/views/datoList/dato_detail_view.dart';
import 'package:servicio_satelital/widgets/navigation_drawer_menu.dart'; // Importa el NavigationDrawerMenu

import 'package:servicio_satelital/models/dato.dart';
import 'package:servicio_satelital/services/dato_service.dart';

class DatoList extends StatefulWidget {
  const DatoList({Key? key}) : super(key: key);

  @override
  State<DatoList> createState() => _DatoListState();
}

class _DatoListState extends State<DatoList> {
  final DatoService _datoService = DatoService();
  int _currentPage = 1; // Página actual
  static const int _limit = 10; // Límite de datos por página
  late Future<List<Dato>> _futureDatos;

  @override
  void initState() {
    super.initState();
    _loadDatos();
  }

  void _loadDatos() {
    _futureDatos = _datoService.getAllData();
  }

  void _nextPage() {
    setState(() {
      _currentPage++;
      _loadDatos();
    });
  }

  void _previousPage() {
    if (_currentPage > 1) {
      setState(() {
        _currentPage--;
        _loadDatos();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Datos'),
      ),
      drawer: NavigationDrawerMenu(), // Incluye el NavigationDrawerMenu
      body: FutureBuilder<List<Dato>>(
        future: _futureDatos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final datos = snapshot.data!;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: datos.length,
                    itemBuilder: (context, index) {
                      final dato = datos[index];
                      return ListTile(
                        title: Text('${dato.name}'),
                        subtitle: Text('Descripción: ${dato.description}'),
                        onTap: () {
                          // Navega a la vista de detalles al hacer clic en el Dato
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DatoDetailView(dato: dato),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _currentPage > 1
                          ? _previousPage
                          : null, // Deshabilitar si estamos en la primera página
                      child: const Text('Anterior'),
                    ),
                    ElevatedButton(
                      onPressed: datos.length == _limit
                          ? _nextPage
                          : null, // Deshabilitar si no hay más datos
                      child: const Text('Siguiente'),
                    ),
                  ],
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
