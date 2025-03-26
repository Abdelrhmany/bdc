import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive/hive.dart';

class Globals {
  final String appLink = ""; // ضع رابط التطبيق هنا
  static var link ; // سيتم تحديثه من الـ API

  Globals() {
    fetchLinkFromApi(); // جلب الرابط عند إنشاء الكائن
  }

  Future<void> fetchLinkFromApi() async {
    try {
      var response = await Dio().get('https://bigdatacoins.io/red/custom-text');
print("🔗 الرابط المستلم من API: $response");
      link=response;
    } catch (e) {
      print("❌ خطأ أثناء جلب الرابط: $e");
    }
  }

  void saveExcludedIds(List<String> ids) async {
    var box = await Hive.openBox('excludedItems');
    await box.put('ids', ids);
  }

  Future<List<String>> getExcludedIds() async {
    var box = await Hive.openBox('excludedItems');
    return box.get('ids', defaultValue: []);
  }

  static List allquistions = []; // متغير لتخزين الرابط

  Future<void> openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}




// import 'dart:async';
// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:dio/dio.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:hive/hive.dart';

// class Globals {
//   final String appLink = ""; // ضع رابط التطبيق هنا
//   static String link =
//       "https://b2cd-196-136-190-118.ngrok-free.app"; // متغير لتخزين الرابط

//   void saveExcludedIds(List<String> ids) async {
//     var box = await Hive.openBox('excludedItems');
//     await box.put('ids', ids);
//   }

//   Future<List<String>> getExcludedIds() async {
//     var box = await Hive.openBox('excludedItems');
//     return box.get('ids', defaultValue: []);
//   }

//   static List allquistions = []; // متغير لتخزين الرابط
//   Future<void> openLink(String url) async {
//     final Uri uri = Uri.parse(url);
//     if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
//       throw Exception('Could not launch $url');
//     }
//   }
// }
