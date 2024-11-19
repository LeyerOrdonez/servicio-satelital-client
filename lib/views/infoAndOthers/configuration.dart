import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _darkMode = false; // Estado del modo oscuro
  String _selectedLanguage = 'Español'; // Idioma predeterminado
  bool _highContrast = false; // Contraste alto para accesibilidad

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/dato');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Selector de idioma
            ListTile(
              title: const Text('Idioma'),
              subtitle: Text(_selectedLanguage),
              trailing: const Icon(Icons.language),
              onTap: () {
                _showLanguageDialog();
              },
            ),
            const Divider(),
            // Alternar modo oscuro
            SwitchListTile(
              title: const Text('Modo Oscuro'),
              value: _darkMode,
              onChanged: (bool value) {
                setState(() {
                  _darkMode = value;
                });
              },
            ),
            const Divider(),
            // Accesibilidad - Contraste alto
            SwitchListTile(
              title: const Text('Contraste Alto'),
              subtitle: const Text('Mejorar visibilidad para usuarios con baja visión.'),
              value: _highContrast,
              onChanged: (bool value) {
                setState(() {
                  _highContrast = value;
                });
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  // Diálogo para seleccionar idioma
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Seleccionar Idioma'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: const Text('Español'),
                value: 'Español',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                    Navigator.pop(context);
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Inglés'),
                value: 'Inglés',
                groupValue: _selectedLanguage,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLanguage = value!;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
