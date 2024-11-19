import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManualView extends StatefulWidget {
  const ManualView({super.key});

  @override
  _ManualViewState createState() => _ManualViewState();
}

class _ManualViewState extends State<ManualView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual de usuario'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/dato');
          },
           
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            context.go('/configApp');
          },
        ),
      ],
      ),
      body: Stack(
        children: [
          // Imagen de fondo que llena toda la pantalla
          Positioned.fill(
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/imagenes-satelital-procesadas.appspot.com/o/backgorund.jpg?alt=media&token=f854913d-858b-482c-95f5-ef726348edc0',
              fit: BoxFit.cover, // Ajusta la imagen para cubrir toda el área
            ),
          ),
          // Contenido principal
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 26, 49, 255).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'Información general',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    '-Esta aplicacion ha sido construida para visualizar procesamientos de otros autores desde el modo matlab' +
                        '\n-la aplicacion solo puede visualizar, no puede procesar'+
                        '\n-se pueden hacer composiciones espacio temporales',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 30, 75, 255).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'Información sobre funcionamiento',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'las imagenes son cargada dede el almacenamiento firebase' +
                        '\nse pueden descargar las imagenes con marca de agua del autor y fecha' +
                        '\nsi está registrado puede realizar comentarios',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),

                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 30, 75, 255).withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    'procedimiento',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: const Text(
                    '1- inicie sesion si aun no lo ha hecho' +
                        '\n2- busque la imagen que quiere ser objeto de analisi espacio temporal' +
                        '\n3 -añada la imagen al modo dataset'+
                        '\nentre al modo dataset e inicie la demostracion',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
