import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';
import 'package:yes_no_app/config/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/config/presentation/widgets/her_message_bubble.dart';
import 'package:yes_no_app/config/presentation/widgets/my_message_bubble.dart';
import 'package:yes_no_app/config/presentation/widgets/shared/message_field_box.dart';

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
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVCuEj8JiLnj7rX-8kbrNA28h6NYjcTIACfQ&s'),
          ),
        ),
        // centrar el titulo
        centerTitle: false,
        title: const Text('Chat'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: const _ChatView(),
    );
  }
}

// trabajar el body de manera separada y es más facil visualmente

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    /**El provider que esta a nivel mayor estara disponible
     * para utiliza debemos llamar al contexto con la propiedad watch la que proviene desde el provider
     * este provider necesita especificar el tipo que será.
     * para este caso es el provider llamada ChatProvider
     * esto esta pendiento de los cambios en la instancia de la clase
     */
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            // al tener de esta forma deja todo muy abajo para evitar esto debemos envolver en un nuevo widget
            // sobre el column presionar ctrl + . y seleccion wrap widget y renombrar
            // Expanded(child: Container(
            //   color: Colors.red,
            // )),
            // const Text('Mundo'),
            Expanded(
                child: ListView.builder(
                  // anterior solo itera una cantidad exacta de mensajes
                    // itemCount: 50,
                    // llamada al chatProvider
                    itemCount: chatProvider.messageList.length,
                    itemBuilder: (context, index) {
                      // anterior
                      // return (index % 2 == 0)
                      //     ? const HerMessageBubble()
                      //     : const MyMessageBuble();

                      // nuevo para listar los mensajes me or her
                      //1. tomar una instancia del message
                      final message = chatProvider.messageList[index];

                      // regreso de la instacia message que es la entidad
                      return (message.fromWho == FromWho.hers)
                      ? const HerMessageBubble()
                      : MyMessageBuble(message:message);
                    })),
            //caja de texto
            const SizedBox(height: 10),
             MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
              },
            ),
            // const Text('Mundo'),

            // Container(
            //   // solo para marcar los bordes y saber donde estamos trabajando
            //   decoration: const BoxDecoration(
            //     border: Border(
            //       top: BorderSide(color: Colors.yellow),
            //       left: BorderSide(color: Colors.yellow),
            //       right: BorderSide(color: Colors.yellow),
            //       bottom: BorderSide(color: Colors.yellow),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
