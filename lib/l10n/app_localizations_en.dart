// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcome => 'WELCOME TO THE ONLINE STORE';

  @override
  String get welcome2 => 'Log in or create an account to explore our products';

  @override
  String get create => 'Create a count';

  @override
  String get login => 'Login';

  @override
  String get user => 'User';

  @override
  String get password => 'password';

  @override
  String get question => 'Not registered yet? Create account';

  @override
  String get email => 'Email';

  @override
  String get allreadyregister => 'Already have an account? Log in';
}
