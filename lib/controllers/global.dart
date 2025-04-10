import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class Globals {
  final String appLink = "";
  static String? link;
  static List<dynamic> allQuestions = [];

  Globals();

  Future<void> fetchLinkFromApi() async {
    try {
      var url = Uri.parse('https://bigdatacoins.io/red/custom-text');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        link = response.body.trim();
        print("🔗 الرابط المستلم من API: $link");

        if (link != null && link!.isNotEmpty) {
          var questionsResponse = await http.get(Uri.parse('$link/questions/'));
          print("الأسئلة: ${questionsResponse.body}");
        } else {
          print("❌ الرابط المستلم فارغ.");
        }
      } else {
        print("❌ خطأ في جلب الرابط: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ خطأ أثناء جلب الرابط: $e");
    }
  }

  Future<void> saveExcludedIds(List<String> ids) async {
    var box = await Hive.openBox('excludedItems');
    await box.put('ids', ids);
  }

  Future<List<String>> getExcludedIds() async {
    var box = await Hive.openBox('excludedItems');
    return box.get('ids', defaultValue: []);
  }

  Future<void> getAllQuestions() async {
    if (link == null || link!.isEmpty) {
      print("❌ الرابط غير متوفر.");
      return;
    }

    var dio = Dio();
    try {
      Response response = await dio.post('$link/questions/p');
      allQuestions = response.data;
      print(allQuestions);
    } catch (e) {
      print("❌ خطأ أثناء جلب الأسئلة: $e");
    }
  }

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
