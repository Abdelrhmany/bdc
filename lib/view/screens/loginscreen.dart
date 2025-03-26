import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bdc/controllers/global.dart';
import 'package:bdc/view/screens/register.dart';

import '../componants/button.dart';
import '../componants/customtextfield.dart';
import '../../generated/l10n.dart';
import 'buttomnavbar.dart';
import 'forgetPassword.dart'; // تأكد من استيراد ملفات الترجمة

class Loginscreen extends StatefulWidget {
  Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final dio = Dio();

  var res;

  Future cc() async {
    var response = await dio.post(
      '${Globals.link}/login',
      data: {'phone': phone.text, 'password': password.text},
    );
    print(response.data);
    res = response.data;
  }

  TextEditingController password = TextEditingController();
  // Create the controller
  TextEditingController phone = TextEditingController();
  // Create the controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            height: 150,
            width: 134,
            child: Image.asset('assets/topone.png'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: CustomTextField(
                controller: phone, // Pass the controller
                hintText:
                    S.of(context).EnteryourphoneNumber, // النص المترجم هنا
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: CustomTextField(
                controller: password, // Pass the controller
                hintText: S.of(context).Enterpassword, // النص المترجم هنا
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 30.0,
              top: 10.0,
              bottom: 10.0,
              left: 30.0,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => Forgetpassword()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(' '),
                  Text(
                    S.of(context).ForgetPassword, // النص المترجم هنا
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomButton(
            onPressed: () async {
              await cc();
              if (res['success'] == true) {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => Buttomnavbar()));
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('Invalid phone or password'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
              // .
            },
            text: S.of(context).Login,
          ),
          const SizedBox(height: 10),
          Image.asset('assets/line.png'),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 100, right: 100, top: 10),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // توسيط المحتوى داخل الصف
              children: [
                Flexible(
                  // يسمح بتغيير حجم النص ليناسب المساحة المتاحة
                  child: Text(
                    S.of(context).Notregisteryet,
                    overflow: TextOverflow.ellipsis, // يمنع التجاوز
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => Register()));
                  },
                  child: Text(
                    S.of(context).CreateAccount,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // Add this Expanded widget
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/one.png',
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
