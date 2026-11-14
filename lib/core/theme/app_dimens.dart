import 'package:flutter/material.dart';

class AppRadius {
  AppRadius._();

  static const BorderRadius badge = BorderRadius.all(Radius.circular(4));
  static const BorderRadius control = BorderRadius.all(Radius.circular(6));
  static const BorderRadius sheet = BorderRadius.vertical(top: Radius.circular(12));
}

class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;

  static const double section = 10;
  static const EdgeInsets screen = EdgeInsets.all(12);
}