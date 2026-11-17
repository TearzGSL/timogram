import 'package:flutter/material.dart';

import '../widgets/settings_option_tile.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configuración')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          SettingsOptionTile(
            icon: Icons.notifications,
            title: 'Notificaciones',
            description: 'Alertas de mensajes y avisos.',
          ),
          SettingsOptionTile(
            icon: Icons.person_outline,
            title: 'Personalización',
            description: 'Apariencia y perfil.',
          ),
          SettingsOptionTile(
            icon: Icons.lock,
            title: 'Privacidad',
            description: 'Datos personales y permisos.',
          ),
          SettingsOptionTile(
            icon: Icons.language,
            title: 'Idioma',
            description: 'Idioma de la aplicación.',
          ),
          SettingsOptionTile(
            icon: Icons.update,
            title: 'Actualizaciones',
            description: 'Versión y novedades.',
          ),
        ],
      ),
    );
  }
}
