import 'package:flutter/material.dart';

import '../pages/chat_page.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.name,
    required this.code,
    required this.description,
  });

  final String name;
  final String code;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: const Icon(Icons.person, color: Colors.white),
      ),
      title: Text('$name ($code)'),
      subtitle: Text(description),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ChatPage(userName: name)),
        );
      },
    );
  }
}
