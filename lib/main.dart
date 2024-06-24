import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/config/presentation/screens/chat/chat_screen.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';



void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //utilización del provider para compartir información a toda la aplicación
    // mutliprovider
    return MultiProvider(
      // este necesita el providers
      providers: [
        //notificador de cambios que crea el uso del tipo ChatProvider
        ChangeNotifierProvider(create: (_)=>ChatProvider())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedcolorIndex: 5).theme(),
        home: const ChatScreen(),
      
        // Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Material App Bar'),
        //   ),
        //   body:  Center(
        //     child: FilledButton.tonal(onPressed: (){}, child: const Text('Click me!')),
        //   ),
        // ),
      ),
    );
  }
}