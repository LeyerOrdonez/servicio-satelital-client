import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Información Adicional'),
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
                    'Información sobre autores',
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
                    'Autor 1: Leyer Angel J. Ordonez Cifuentes \nCorreo: leyer.ordonez01@uceva.edu.co' +
                        '\nLinkedin : ***',
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
                    'Información sobre aplicación',
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
                    'Versión 0.1.0' +
                        '\nAlmacenamiento: Firebase' +
                        '\nPolítica de uso: libre',
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
