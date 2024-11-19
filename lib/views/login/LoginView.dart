import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servicio_satelital/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserService _userService = UserService();
  final _emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

  Future<void> _saveFirstName(String firstName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('firstName', firstName); // Guardar el nombre
  }

  Future<void> _saveLastName(String lastName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastName', lastName);
  }

  Future<void> _saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future<void> _saveId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('id', id);
  }

  // Función para realizar el login
  Future<void> _login() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (!RegExp(_emailPattern).hasMatch(email)) {
      _showSnackBar('Formato de correo incorrecto');
      return;
    }

    try {
      // Intentar hacer login con el servicio
      Map<String, String>? loginResponse =
          await _userService.login(email, password);

      if (loginResponse != null) {
        await _saveFirstName(
            loginResponse['firstName']!); // Guardar nombre en SharedPreferences
        await _saveLastName(
            loginResponse['lastName']!); //Guardar apellido en SharedPreferences
        await _saveEmail(
            loginResponse['email']!); //Guardar email en SharedPreferences
        await _saveId(
            int.parse(loginResponse['id']!)); //Guardar ID en SharedPreferences
        
        context.go('/dato');
      } else {
        _showSnackBar('Correo o Password incorrecta');
      }
    } catch (e) {
      _showSnackBar('Error al iniciar sesión: $e');
    }
  }

  // Función para mostrar SnackBar
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(
        children: [
          // Imagen de fondo que llena toda la pantalla
          Positioned.fill(
            child: Image.network(
              'https://firebasestorage.googleapis.com/v0/b/imagenes-satelital-procesadas.appspot.com/o/backgorund.jpg?alt=media&token=f854913d-858b-482c-95f5-ef726348edc0',
              fit: BoxFit.cover, // Asegura que la imagen cubra todo el área
            ),
          ),
          // Contenido del formulario de login
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8), // Fondo blanco semitransparente
                      borderRadius: BorderRadius.circular(20.0), // Bordes redondeados
                    ),
                    child: const Text(
                      'Bienvenido a servicio satelital', // Texto estático
                      style: TextStyle(color: Colors.black), // Texto negro
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo Electrónico',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: /*_login*/ null
                      ,
                    child: const Text('Iniciar Sesión'),
                    
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.go('/dato');
                    },
                    child: const Text('Ingreso Local'),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      context.go('/createUser');
                    },
                    child: const Text('¿No tienes cuenta? Regístrate aquí'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
