import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bdc/controllers/global.dart';
import 'package:bdc/view/componants/customtextfield.dart';
import 'dart:convert';

import '../componants/button.dart';
import 'resetPassword.dart';

class Forgetpassword extends StatelessWidget {
  Forgetpassword({super.key});
  var phone = TextEditingController();
  var dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 189,
              width: 134,
              child: Image.asset('assets/topone.png'),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: const Text(
              'forget password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: CustomTextField(
                controller: phone,
                hintText: "Enter  Phone Number",
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: CustomButton(
              onPressed: () async {
                await dio.post(
                  '${Globals.link}/request-otp',
                  data: {"phone": phone.text},
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Resetpassword(phonee: phone.text),
                  ),
                );
              },
              text: 'Send whatsapp otp',
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            // Add this Expanded widget
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset('assets/send_otp.png'),
            ),
          ),
        ],
      ),
    );
  }
}
