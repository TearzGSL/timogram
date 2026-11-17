import 'package:flutter/material.dart';

import '../widgets/contact_search_field.dart';
import '../widgets/user_tile.dart';
import 'add_contact_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timogram'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Configuración',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            ContactSearchField(),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  UserTile(
                    name: 'Contacto de ejemplo',
                    code: '001',
                    description: 'Toca para abrir el chat.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Añadir contacto',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddContactPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
