import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawerMenu extends StatefulWidget {
  const NavigationDrawerMenu({super.key});

  @override
  _NavigationDrawerMenuState createState() => _NavigationDrawerMenuState();
}

class _NavigationDrawerMenuState extends State<NavigationDrawerMenu> {
  String _firstName = ''; // Valor por defecto

  @override
  void initState() {
    super.initState();
    _loadFirstName(); // Cargar el nombre del usuario cuando se inicializa el widget
  }

  // Método para cargar el nombre del usuario desde SharedPreferences
  Future<void> _loadFirstName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _firstName = prefs.getString('firstName') ?? 'Invitado';
    });
  }

  // Método para confirmar el cierre de sesión
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Logout'),
          content: const Text('¿Estás seguro de que quieres cerrar sesión?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
                _logout(context); // Llama a la función de logout
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  // Método para hacer logout
  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(
        'firstName'); // Elimina el nombre del usuario de SharedPreferences
    context.go('/'); // Redirige a la página de Login (ruta '/')
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Bienvenido  $_firstName', // Muestra el nombre del usuario
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.blue),
            title: const Text(
              'Usuarios',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              context.go('/usuarios'); // Navega a la vista de usuarios
              Navigator.of(context).pop(); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.precision_manufacturing_outlined, color: Colors.blue),
            title: const Text(
              'Procesamientos',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              context.go('/dato');
              Navigator.of(context).pop(); // Cierra el Drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.map, color: Colors.blue),
            title: const Text(
              'Mis Procesamientos',
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              context.go('/dato'); 
              Navigator.of(context).pop(); // Cierra el Drawer
            }
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.blue),
            title: const Text('Perfil', style: TextStyle(color: Colors.blue)),
            onTap: () {
              context.go('/perfil'); // Navega a la vista de perfil de usuario
              Navigator.of(context).pop(); // Cierra el Drawer
            }
          ),
          const Divider(), // Línea divisoria
           ListTile(
            leading: const Icon(Icons.book, color: Colors.green),
            title: const Text('Manual de usuario', style: TextStyle(color: Colors.green)),
            onTap: () {
              context.go('/'); // Navega a la vista de perfil de usuario
              Navigator.of(context).pop(); // Cierra el Drawer
            }
          ),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.green),
            title: const Text('Informacion de la aplicacion', style: TextStyle(color: Colors.green)),
            onTap: () {
              context.go('/'); // Navega a la vista de perfil de usuario
              Navigator.of(context).pop(); // Cierra el Drawer
            }
          ),
          ListTile(
            leading: const Icon(Icons.key, color: Colors.green),
            title: const Text('Configuracion', style: TextStyle(color: Colors.green)),
            onTap: () {
              context.go('/'); // Navega a la vista de perfil de usuario
              Navigator.of(context).pop(); // Cierra el Drawer
            }
          ),
          const Divider(), // Línea divisoria
          ListTile(
            leading:
                const Icon(Icons.logout, color: Colors.red), // Icono en rojo
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.red), // Texto en rojo
            ),
            onTap: () {
              _confirmLogout(context); // Muestra el diálogo de confirmación
            },
          ),
        ],
      ),
    );
  }
}
