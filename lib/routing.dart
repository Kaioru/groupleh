import 'package:groupleh/app/app.dart';
import 'package:groupleh/app/auth/login.dart';
import 'package:groupleh/app/auth/register.dart';

final routes = {
  '/': (context) => new App(),
  '/login': (context) => new Login(),
  '/register': (context) => new Register(),
};
