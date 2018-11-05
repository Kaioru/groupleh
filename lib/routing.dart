import 'home.dart';
import 'auth/login.dart';
import 'auth/registration.dart';

final routes = {
  '/': (context) => new HomePage(),
  '/login': (context) => new LoginPage(),
  '/register': (context) => new RegistrationPage(),
};
