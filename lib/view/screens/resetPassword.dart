import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bdc/controllers/global.dart';
import 'package:bdc/view/componants/customtextfield.dart';

import '../componants/button.dart';

class Resetpassword extends StatelessWidget {
  Resetpassword({super.key, required this.phonee});
  var dio = Dio();
  var phonee;
  var otp = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Center(
            child: Container(
              height: 150,
              width: 134,
              child: Image.asset('assets/topone.png', fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'the otp',
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
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomTextField(
                controller: otp,
                hintText: "Enter the otp",
              ),
            ),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'new password',
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
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CustomTextField(
                controller: password,
                hintText: "**********",
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              'Confirm Password',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Center(
          //   child: Padding(
          //     padding: const EdgeInsets.only(left: 30, right: 30),
          //     child: CustomTextField(
          //       controller: phone,
          //       hintText: "**********",
          //     ),
          //   ),
          // ),
          const SizedBox(height: 10),
          Center(
            child: CustomButton(
              onPressed: () {
                dio.post(
                  "${Globals.link}/verify-otp",
                  data: {
                    "phone": phonee,
                    "otp": otp.text,
                    "password": password.text,
                  },
                );
              },
              text: 'Done',
            ),
          ),
          const SizedBox(height: 50),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/reset_password.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
