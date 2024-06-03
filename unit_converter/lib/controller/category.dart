import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/pages/converter_pages.dart';

class Category extends StatelessWidget {
  final String name;
  final String icon;
  final List<Unit> units;
  int Used = 0;

  Category({required this.name, required this.icon , required this.units, required this.Used});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(20),
        color: Colors.deepOrange.shade50,
        child: Container(
          height: 75,
          child: ElevatedButton (
            onPressed: () {
              _navigateToConverter(context);
              Used++;
            },
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: 38,
                    height: 38,
                    child: Image.asset(icon, fit: BoxFit.cover),
                  ),
                ),
                Center(child: Text(name, style: TextStyle(fontSize: 20, color: Colors.black)))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _navigateToConverter(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ConverterScreen(name: name , units:units);
    }));
  }
}
