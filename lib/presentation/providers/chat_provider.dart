import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatAScrollController = ScrollController();
  // a modo de prueba se crea aca la instancia del servicio http
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer(); 

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

    if (text.endsWith('?')) {
      await herReply();
    }
    // notificar al proveedor de los cambios
    notifyListeners();
    moveScrollToBottom();
  }

  // llamada api
  Future<void> herReply()async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
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