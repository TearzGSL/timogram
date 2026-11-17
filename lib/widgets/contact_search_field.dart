import 'package:flutter/material.dart';

class ContactSearchField extends StatelessWidget {
  const ContactSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: 'Buscar',
      ),
    );
  }
}
