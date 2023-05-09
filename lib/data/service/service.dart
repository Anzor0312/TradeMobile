import 'package:dio/dio.dart';
import 'package:trademobile/data/model/mobile_model.dart';

class MobileService {
  Future<dynamic> getMobile(String category) async {
    print(category);
    try {
      Response response =
          await Dio().get(category);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => MobileModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.error.toString();
    }
  }
}
