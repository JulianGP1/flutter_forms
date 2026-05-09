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

  @override
  String get createProduct => 'Producto Creado';

  @override
  String get name => 'Nombre del producto';

  @override
  String get price => 'Precio del producto';

  @override
  String get description => 'Description del producto';

  @override
  String get image_url => 'Url de la imagen';

  @override
  String get image_valid => 'imagen valida';

  @override
  String get required_field => 'campo requerido';

  @override
  String get home => 'Inicio';

  @override
  String get toggle_theme => 'Cambiar tema';

  @override
  String get change_language => 'Cambiar lenguaje';

  @override
  String get log_out => 'Cerrar sesion';

  @override
  String get user_data => 'Informacion del Usuario';
}
