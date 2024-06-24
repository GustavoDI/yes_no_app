import 'package:flutter/material.dart';
import 'package:yes_no_app/config/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  // crear lista de mensajes de prueba
  List<Message> messageList =[
    Message(text: 'Hola esposa', fromWho: FromWho.me),
    Message(text: 'Salio del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // notificar al proveedor de los cambios
    notifyListeners();
  }
}