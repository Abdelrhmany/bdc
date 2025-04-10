import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'global.dart';

var dio = Dio();
Future<List> getdata(ids) async {
  var ids;
  try {
    Response response = await dio.get('${Globals.link}/questions/');
    Globals.allQuestions = response.data;
    print(Globals.allQuestions);
    return response.data;
  } catch (e) {
    print(e);
    return [];
  }
}
