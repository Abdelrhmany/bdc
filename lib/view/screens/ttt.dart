import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhoneInputScreen(),
    );
  }
}

class PhoneInputScreen extends StatefulWidget {
  @override
  _PhoneInputScreenState createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  final _controller = TextEditingController();
  String? parsedData;

  late List<CountryWithPhoneCode> countries;
  CountryWithPhoneCode? selectedCountry;

  @override
  void initState() {
    super.initState();
    countries = CountryManager().countries;
    selectedCountry = countries.firstWhere(
      (c) => c.countryCode == 'EG',
      orElse: () => countries.first,
    );
  }

  Future<void> _parseAndPrint() async {
    try {
      final res = await parse(
        _controller.text,
        region: selectedCountry?.countryCode ?? 'EG',
      );

      const encoder = JsonEncoder.withIndent('  ');
      setState(() {
        parsedData = encoder.convert(res);
      });

      print('Parsed:\n$parsedData');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res['international'] ?? 'No result')),
      );
    } catch (e) {
      print(e);
      setState(() => parsedData = null);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('فشل في تحليل الرقم')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Parser')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<CountryWithPhoneCode>(
              isExpanded: true,
              value: selectedCountry,
              onChanged: (value) {
                setState(() {
                  selectedCountry = value;
                });
              },
              items: countries.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text('${country.countryName} (+${country.phoneCode})'),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _parseAndPrint,
              child: Text('Parse Number'),
            ),
            SizedBox(height: 16),
            if (parsedData != null)
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  parsedData!,
                  style: TextStyle(fontFamily: 'monospace'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
