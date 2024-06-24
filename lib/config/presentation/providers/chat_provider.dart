import 'package:flutter/material.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatAScrollController = ScrollController();

  // crear lista de mensajes de prueba
  List<Message> messageList =[
    Message(text: 'Hola esposa', fromWho: FromWho.me),
    Message(text: 'Salio del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{
    if (text.isEmpty) {
      return;
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // notificar al proveedor de los cambios
    notifyListeners();
    moveScrollToBottom();
  }

  // hacer el scroll
  Future<void> moveScrollToBottom ()async{
    //para que se pueda esperar una diferencia entre que llega el mensaje y ser visto
    await Future.delayed(const Duration(milliseconds: 150));

    chatAScrollController.animateTo(
      chatAScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut);
  }
}