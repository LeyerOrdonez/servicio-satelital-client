import 'package:go_router/go_router.dart';
import 'package:servicio_satelital/views/infoAndOthers/configuration.dart';
import 'package:servicio_satelital/views/infoAndOthers/infoApp.dart';
// Importa las vistas necesarias
import 'package:servicio_satelital/views/login/LoginView.dart';
import 'package:servicio_satelital/views/login/RegisterView.dart';
import 'package:servicio_satelital/views/userGlobal/user_create_view.dart';
import 'package:servicio_satelital/views/userGlobal/user_delete_view.dart';
import 'package:servicio_satelital/views/userGlobal/user_edit_view.dart';
import 'package:servicio_satelital/views/userGlobal/user_list_view.dart';
import 'package:servicio_satelital/views/userPersonal/user_profile_view.dart';
import 'package:servicio_satelital/views/datoList/dato_list_view.dart'; 
import 'package:servicio_satelital/views/infoAndOthers/usermanualApp.dart'; 

final router = GoRouter(
  routes: [
    // Ruta para el login (ruta inicial)
    GoRoute(
      path: '/',
      builder: (context, state) => LoginView(),
    ),
    // Ruta para listar usuarios
    GoRoute(
      path: '/usuarios',
      builder: (context, state) => const UserList(),
    ),
    // Ruta para crear un nuevo usuario
    GoRoute(
      path: '/usuarios/create',
      builder: (context, state) => const UserCreate(),
    ),
    // Ruta para editar un usuario existente
    GoRoute(
      path: '/usuarios/edit/:id',
      builder: (context, state) {
        final idusuario = state.params['id']!;
        return UserEdit(idusuario: idusuario);
      },
    ),
    // Ruta para eliminar un usuario
    GoRoute(
      path: '/usuarios/delete/:id',
      builder: (context, state) {
        final userId = state.params['id']!;
        return UserDelete(userId: int.parse(userId));
      },
    ),
    // Ruta para listar Pokémon
    
    
    GoRoute(
      path: '/perfil',
      builder: (context, state) => const UserProfileView(),
    ),
    GoRoute(
      path: '/createUser',
      builder: (context, state) => const UserRegister(), // Pasa el ID del equipo aquí
    ),
   
    GoRoute(
      path: '/dato',
      builder: (context, state) =>
          const DatoList(), // Vista para listar data
    ),
    
    GoRoute(
      path: '/infoApp',
      builder: (context, state) =>
          const InfoView(), // Vista para info
    ),
    GoRoute(
      path: '/manualApp',
      builder: (context, state) =>
          const ManualView(), // Vista para manual
    ),
    GoRoute(
      path: '/configApp',
      builder: (context, state) =>
          const SettingsView(), // Vista para ajustes
    ),
   
  ],
);
