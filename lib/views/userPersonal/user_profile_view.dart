import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:servicio_satelital/widgets/navigation_drawer_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  _UserProfileViewState createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  int? id;
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '******'; // Muestra la contraseña enmascarada por defecto

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getInt('id');
      firstName = prefs.getString('firstName') ?? '';
      lastName = prefs.getString('lastName') ?? '';
      email = prefs.getString('email') ?? '';
      password = '******';
    });
  }

  Future<void> _showEditConfirmationDialog() async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Edición'),
          content: Text('¿Deseas editar la información del usuario?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
    if (confirm == true && id != null) {
      context.go('/usuarios/edit/$id');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Usuario'),
      ),
      drawer: const NavigationDrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: $id', style: TextStyle(fontSize: 18)),
            Text('Nombre: $firstName', style: TextStyle(fontSize: 18)),
            Text('Apellido: $lastName', style: TextStyle(fontSize: 18)),
            Text('Email: $email', style: TextStyle(fontSize: 18)),
            Text('Password: $password', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20), // Espacio entre los textos y el botón
            ElevatedButton(
              onPressed: _showEditConfirmationDialog,
              child: Text('Editar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}
