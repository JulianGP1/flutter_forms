// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcome => 'BIENVENIDO A LA TIENDA ONLINE';

  @override
  String get welcome2 =>
      'Inicia sesión o crea una cuenta para explorar nuestros productos';

  @override
  String get create => 'Crear una cuenta';

  @override
  String get login => 'Iniciar sesión';

  @override
  String get user => 'Usuario';

  @override
  String get password => 'Contraseña';

  @override
  String get question => '¿Aun no estas registrado? Crear cuenta';

  @override
  String get email => 'Correo';

  @override
  String get allreadyregister => '¿Ya tienes cuenta? Inicia sesión';
}
