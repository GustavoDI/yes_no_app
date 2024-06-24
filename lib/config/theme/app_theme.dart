import 'package:flutter/material.dart';

// el color personalizado con guión bajo indica que es privado y solo se puede utilizar en este archivo
const Color _customColor = Color(0xff49149f);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.red,
  Colors.purple,
];

class AppTheme {
  // Si el arreglo de colores es sobrepassado regresa un error
  // porque es static? porque no necesitamos instanciar la clase para acceder a este método
  // static Color color(int index){
  //   if(index >= _colorTheme.length){
  //     throw Exception('Color index $index out of range');
  //   }
  //   return _colorTheme[index];
  // }

  final int selectedcolorIndex;

  AppTheme({this.selectedcolorIndex = 0})
      : assert(
            selectedcolorIndex >= 0 && selectedcolorIndex < _colorTheme.length);

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedcolorIndex],
      // brightness: Brightness.dark,
    );
  }
}
