import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bdc/controllers/global.dart';
import 'package:bdc/view/componants/button.dart';
import 'package:dio/dio.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart' ;
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Invite extends StatefulWidget {
  const Invite({super.key});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  bool _imagesLoaded = false;
  bool _isLoadingImages = false;

  String phoneNumber = ''; // لتخزين رقم الهاتف مع رمز الدولة

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_isLoadingImages) {
      _isLoadingImages = true;
      _precacheImages();
    }
  }

  Future<void> _precacheImages() async {
    await Future.wait([
      precacheImage(const AssetImage('assets/bottomjoin.png'), context),
      precacheImage(const AssetImage('assets/topone.png'), context),
    ]);

    if (mounted) {
      setState(() {
        _imagesLoaded = true;
      });
    }

    print("✅ جميع الصور تم تحميلها مسبقًا!");
  }

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
/////
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
        SnackBar(content: Text(' please enter a valid number')),
      );
    }
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: _imagesLoaded
          ? Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/bottomjoin.png'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 134,
                      child: Image.asset('assets/topone.png'),
                    ),
                    const SizedBox(height: 100),
                    const Text(
                      'Invite Friends',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          phoneNumber = number.phoneNumber ?? '';
                          print('Phone Number: $phoneNumber');
                        },
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.DROPDOWN,
                        ),
                        ignoreBlank: false,
                        autoValidateMode: AutovalidateMode.disabled,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        initialValue: PhoneNumber(isoCode: 'US'),
                        textFieldController: TextEditingController(),
                        formatInput: true,
                        keyboardType: const TextInputType.numberWithOptions(
                          signed: true,
                          decimal: false,
                        ),
                        inputDecoration: const InputDecoration(
                          hintText: 'Enter phone number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: CustomButton(
                        onPressed: () async {
                          try {
                            var dio = Dio();
                            Response response = await dio.post(
                              '${Globals.link}/invite',
                              data: {'phone': phoneNumber}, 
                            );
                            print('✅ Request Done: ${response.data}');
                          } catch (e) {
                            print('❌ Request Failed: $e');
                          }
                        },
                        text: 'Invite',
                      ),    
                    ),
                  ],
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}



