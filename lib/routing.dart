import 'package:groupleh/app/app.dart';
import 'package:groupleh/auth/login.dart';
import 'package:groupleh/auth/registration.dart';

final routes = {
  '/': (context) => new App(),
  '/login': (context) => new LoginPage(),
  '/register': (context) => new RegistrationPage(),
};
