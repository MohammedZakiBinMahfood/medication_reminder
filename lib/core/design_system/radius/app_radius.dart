import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const double xs = 4.0;
  static const double s = 8.0;
  static const double m = 12.0;
  static const double l = 16.0;
  static const double xl = 24.0;
  static const double circular = 999.0;

  static const Radius radiusXs = Radius.circular(xs);
  static const Radius radiusS = Radius.circular(s);
  static const Radius radiusM = Radius.circular(m);
  static const Radius radiusL = Radius.circular(l);
  static const Radius radiusXl = Radius.circular(xl);
  static const Radius radiusCircular = Radius.circular(circular);

  static const BorderRadius borderXs = BorderRadius.all(radiusXs);
  static const BorderRadius borderS = BorderRadius.all(radiusS);
  static const BorderRadius borderM = BorderRadius.all(radiusM);
  static const BorderRadius borderL = BorderRadius.all(radiusL);
  static const BorderRadius borderXl = BorderRadius.all(radiusXl);
  static const BorderRadius borderCircular = BorderRadius.all(radiusCircular);
}
