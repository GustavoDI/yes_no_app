import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';
class MyMessageBuble extends StatelessWidget {
  final Message message;

  const MyMessageBuble({
    super.key, 
    required this.message
    });

  @override
  Widget build(BuildContext context) {
    // tomar todos los colores que fueron creados
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20)
          ),
          // dejar despegadas las burbujas

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message.text, 
            style: const TextStyle(color: Colors.white),),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}