/// Contrato de autenticación. La interfaz depende de esta abstracción y no
/// de un proveedor concreto (mitiga el acoplamiento descrito en DT-05/DT-06).
abstract class AuthService {
  /// Devuelve false si el correo ya está registrado.
  bool register(String email, String password);

  /// Devuelve true si las credenciales corresponden a un usuario registrado.
  bool login(String email, String password);
}

/// Implementación temporal en memoria para el prototipo académico.
/// No trae usuarios ni contraseñas escritos en el código.
/// Limitación: no persiste datos ni cifra contraseñas; debe sustituirse por
/// un proveedor real (p. ej. Firebase Auth) antes de cualquier uso real.
class InMemoryAuthService implements AuthService {
  final Map<String, String> _users = {};

  String _normalize(String email) => email.trim().toLowerCase();

  @override
  bool register(String email, String password) {
    final key = _normalize(email);
    if (_users.containsKey(key)) return false;
    _users[key] = password;
    return true;
  }

  @override
  bool login(String email, String password) {
    final stored = _users[_normalize(email)];
    return stored != null && stored == password;
  }
}
