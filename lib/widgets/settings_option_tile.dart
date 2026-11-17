import 'package:flutter/material.dart';

class SettingsOptionTile extends StatelessWidget {
  const SettingsOptionTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 40),
      title: Text(title),
      subtitle: Text(description),
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}
