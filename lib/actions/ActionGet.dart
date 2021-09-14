import 'package:dio/dio.dart';
import 'package:project_app/config/Urls.dart';

class ActionGet {
  static Dio dio = Dio(BaseOptions(baseUrl: Urls.api));
  static getSheetData() async {
    try {
      final response = await dio.get('');
      if (response.data != null) {
        print('${response.data.length}');
        return response.data;
      } else {
        print('Data is Null');
      }
    } on DioError catch (err) {
      print(err);
      return 'Error';
    }
  }
}

/*

*/
