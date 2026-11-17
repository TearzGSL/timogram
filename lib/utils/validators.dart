/// Validaciones de entrada reutilizables (formularios y mensajes).
class Validators {
  Validators._();

  static final RegExp _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
  static const int maxMessageLength = 500;

  static String? email(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Ingresa tu correo';
    if (!_emailRegex.hasMatch(text)) return 'Correo no válido';
    return null;
  }

  static String? password(String? value) {
    final text = value ?? '';
    if (text.isEmpty) return 'Ingresa una contraseña';
    if (text.length < 8) return 'Mínimo 8 caracteres';
    if (!text.contains(RegExp(r'[A-Za-z]')) || !text.contains(RegExp(r'\d'))) {
      return 'Debe incluir letras y números';
    }
    return null;
  }

  static String? confirmPassword(String? value, String original) {
    if (value == null || value.isEmpty) return 'Confirma tu contraseña';
    if (value != original) return 'Las contraseñas no coinciden';
    return null;
  }

  static String? message(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'El mensaje está vacío';
    if (text.length > maxMessageLength) return 'Mensaje demasiado largo';
    return null;
  }

  static String? phone(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Ingresa un número';
    if (!RegExp(r'^\+?\d{7,15}$').hasMatch(text)) return 'Número no válido';
    return null;
  }
}
