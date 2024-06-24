import 'package:dio/dio.dart';
import 'package:yes_no_app/config/infraestructure/models/yes_no_model.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    // dar estructura  a la respuesta
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    // esto es un mapper
    // return Message(
    //   text: yesNoModel.answer,
    //   fromWho: FromWho.hers,
    //   imageUrl: yesNoModel.image);

    return yesNoModel.toMessageEntity();
  }
}
