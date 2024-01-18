import 'dart:developer';

import 'package:dio/dio.dart';

class DeleteApi {
  static Future<void> deleteData({int? id}) async {
    var dio = Dio();
    try {
      final response =
          await dio.delete('https://gorest.co.in/public/v2/users/$id',
              options: Options(
                headers: {
                  "Content-Type": "application/json",
                  "Authorization":
                      "Bearer c9deacfd00d58aef0219b783eebff9cbac46821034ee07d465a2424b341c7725"
                },
              ));
              log('response is : ${response.data}');
              log('message is : ${response.statusMessage}');
              
     
    } catch (e) {
      log('Error Data Not Deleted!');
    }
  }
}
