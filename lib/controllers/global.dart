import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:hive/hive.dart';

class Globals {
  final String appLink = "https://bigdatacoins.io/"; // ضع رابط التطبيق هنا
  static String link = "http://loleorfqmx.a.pinggy.link"; // متغير لتخزين الرابط

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
