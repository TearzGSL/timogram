import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'services/auth_service.dart';

void main() {
  runApp(MyApp(authService: InMemoryAuthService()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.authService});

  /// Servicio de autenticación inyectado (facilita pruebas y el cambio
  /// futuro a Firebase sin tocar la interfaz).
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timogram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.purple[100]!,
        ),
      ),
      home: LoginPage(authService: authService),
    );
  }
}
