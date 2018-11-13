import 'package:groupleh/app/app.dart';
import 'package:groupleh/app/auth/login.dart';
import 'package:groupleh/app/auth/registration.dart';

final routes = {
  '/': (context) => new App(),
  '/login': (context) => new LoginPage(),
  '/register': (context) => new RegistrationPage(),
};
