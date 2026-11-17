// NOTA: si en pubspec.yaml el campo "name:" no es "chat", cambie
// "package:chat/" por "package:<su_nombre>/" en los imports de este archivo.
import 'package:chat/main.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Validators', () {
    test('correo vacío es inválido', () {
      expect(Validators.email(''), isNotNull);
    });
    test('correo sin dominio es inválido', () {
      expect(Validators.email('persona@'), isNotNull);
    });
    test('correo válido', () {
      expect(Validators.email('persona@correo.com'), isNull);
    });
    test('contraseña corta es inválida', () {
      expect(Validators.password('abc123'), isNotNull);
    });
    test('contraseña sin números es inválida', () {
      expect(Validators.password('sololetras'), isNotNull);
    });
    test('contraseña válida', () {
      expect(Validators.password('Clave1234'), isNull);
    });
    test('confirmación distinta es inválida', () {
      expect(Validators.confirmPassword('otra', 'Clave1234'), isNotNull);
    });
    test('mensaje vacío es inválido', () {
      expect(Validators.message('   '), isNotNull);
    });
    test('mensaje demasiado largo es inválido', () {
      expect(Validators.message('a' * 501), isNotNull);
    });
    test('teléfono válido e inválido', () {
      expect(Validators.phone('+573001234567'), isNull);
      expect(Validators.phone('abc'), isNotNull);
    });
  });

  group('InMemoryAuthService', () {
    test('no existen usuarios por defecto', () {
      final auth = InMemoryAuthService();
      expect(auth.login('test@example.com', 'password'), isFalse);
    });
    test('registro y login correctos', () {
      final auth = InMemoryAuthService();
      expect(auth.register('Ana@Correo.com', 'Clave1234'), isTrue);
      expect(auth.login('ana@correo.com', 'Clave1234'), isTrue);
    });
    test('contraseña incorrecta falla', () {
      final auth = InMemoryAuthService()..register('a@b.com', 'Clave1234');
      expect(auth.login('a@b.com', 'Otra1234'), isFalse);
    });
    test('no permite registrar el mismo correo dos veces', () {
      final auth = InMemoryAuthService();
      expect(auth.register('a@b.com', 'Clave1234'), isTrue);
      expect(auth.register('a@b.com', 'Clave1234'), isFalse);
    });
  });

  group('Pantalla de login', () {
    testWidgets('rechaza campos vacíos', (tester) async {
      await tester.pumpWidget(MyApp(authService: InMemoryAuthService()));
      await tester.tap(find.widgetWithText(ElevatedButton, 'Iniciar sesión'));
      await tester.pump();
      expect(find.text('Ingresa tu correo'), findsOneWidget);
    });

    testWidgets('credenciales no registradas muestran aviso', (tester) async {
      await tester.pumpWidget(MyApp(authService: InMemoryAuthService()));
      await tester.enterText(find.byType(TextFormField).at(0), 'a@b.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'Clave1234');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Iniciar sesión'));
      await tester.pump();
      expect(find.text('Credenciales incorrectas'), findsOneWidget);
    });

    testWidgets('usuario registrado entra al inicio', (tester) async {
      final auth = InMemoryAuthService()..register('a@b.com', 'Clave1234');
      await tester.pumpWidget(MyApp(authService: auth));
      await tester.enterText(find.byType(TextFormField).at(0), 'a@b.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'Clave1234');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Iniciar sesión'));
      await tester.pumpAndSettle();
      expect(find.text('Timogram'), findsOneWidget);
    });
  });
}
