import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;

  const MessageFieldBox({
    super.key, 
    required this.onValue
    });

  @override
  Widget build(BuildContext context) {
    // tomar control de lo que el usuario esta escribiendo
    final textController = TextEditingController();
    // tener el foco
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
          // pista de lo que debe colocar el usurio
          hintText: 'End your message with a "?"',
          // agregar bordes al input habilitar bordes
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          // agregar color al input
          filled: true,
          // agregar icono tipo botón para que pueda ser presionado
          suffixIcon: IconButton(
            // widget para presionar el botón
            onPressed: () {
              // obtener el valor de la caja
              final textValue = textController.value.text;
              // limpiar caja al enviar mensaje
              textController.clear();
              // Esto es llamar método que hay en el padre
              onValue(textValue);
            },
            // agregar icono que muestra que algo de envia es como una flecha
            icon: const Icon(Icons.send_sharp),
          ));


    return TextFormField(
      // perder el foco fuera del inpunt
      onTapOutside: (event) {
        focusNode.unfocus();
      },

      focusNode: focusNode,
      // controller
      controller: textController,
      // Decoración del input
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        onValue(value);
        // si es submit siempre tendra el foco ahí
        focusNode.requestFocus();
      },
      
    );
  }
}
