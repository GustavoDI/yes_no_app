# yes_no_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Ocultar debug
    debugShowCheckedModeBanner: false
## 2. Estilo Gobal para la aplicación
    1. crear colores personalizados
    const Color _customColor = Color(0xff49149f);

    2. crear una lista de colores con el tipo Color y además dejando privado.
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

## 3. crear la clase AppTheme para el manejo
        
        class AppTheme {
      
## 3.1creando variable de selección
        final int selectedcolorIndex;
## 3.2 Agregando valores al constructor + validación
        AppTheme({this.selectedcolorIndex = 0})
            : assert(
                  selectedcolorIndex >= 0 && selectedcolorIndex < _colorTheme.length);
    // Como un Theme debe retornar un ThemaData se agrega el ThemeData con el nombre de theme 
        ThemeData theme() {
            // rebe retornar el ThemeData
          return ThemeData(
            useMaterial3: true,
            colorSchemeSeed: _colorTheme[selectedcolorIndex],
            // brightness: Brightness.dark,
          );
        }
        }
## 4 Pantalla chat screen
    Crear pantalla de chat utilizando los shortcut
    imporm y stlesw
    crear el scaffold, agregar el navbar (appBar: AppBar
    agregar leading = espacio antes del titulo, se usa para agregar un widget antes del titulo.
    Para conseguir que tenga una medida especifica se puede agregar un padding ctrl + . o barra espaciadora sobre el leading
    y si queremos agrega una imagen backgroundimage (solo ejemplo) )

    class ChatScreen extends StatelessWidget {
      const ChatScreen({super.key});
    
      @override
      Widget build(BuildContext context) {
        // si sabemos que el widget sera utilizados para mostrar una pantalla de carga
        // debemos utilizar scaffold 
        return Scaffold(
          appBar: AppBar(
            // espacio antes del titulo, se usa para agregar un widget antes del titulo.
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVCuEj8JiLnj7rX-8kbrNA28h6NYjcTIACfQ&s'),
              ),
            ) ,
            // centrar el titulo
            centerTitle: false,
            title: const Text('Chat'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],),
        );
      }
    }

## instalar provider