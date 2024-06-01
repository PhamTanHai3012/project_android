import 'package:flutter/material.dart';
import 'package:unit_converter/unit.dart';

class Category {
  final String iconLocation;
  final String name;
  final ColorSwatch color;
  final List<Unit> units;

  const Category({required this.iconLocation, required this.name, required this.color, required this.units,})
      : assert(iconLocation != null), assert(name != null), assert(color != null), assert(units != null);}
