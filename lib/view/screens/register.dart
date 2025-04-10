import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bdc/view/componants/smallcustomtextfield.dart';
import 'package:bdc/view/componants/customtextfield.dart';

import '../../controllers/global.dart';
import '../componants/button.dart';
import '../componants/customdrop.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final dio = Dio();

  var x = TextEditingController();

  var password = TextEditingController();

  var phonenum = TextEditingController();
  var age = TextEditingController();
  var scope = TextEditingController();
  var job = TextEditingController();
  var otp = TextEditingController();

  bool checked = false;

  Future cc() async {
    var response = await dio.post(
      '${Globals.link}/request-otp',
      data: {'phone': phonenum.text},
    );
    print(response);
    checked = true;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 7, left: 7),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
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
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Create a new Account',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: CustomTextField(
                    controller: phonenum,
                    hintText: 'Enter Phone Number',
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 10),
                    const Text('check phone number'),
                    const SizedBox(width: 10),
                    Checkbox(
                      value: checked,
                      onChanged: (v) async {
                        await cc();
                        setState(() {
                          checked = true;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'New password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: CustomTextField(
                    controller: password,
                    hintText: '************',
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Confirm  password',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: CustomTextField(controller: otp, hintText: 'Otp'),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text('Job'),
                        const SizedBox(height: 5),
                        SmallCustomShapeField(controller: x),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Column(
                      children: [
                        const Text('Country'),
                        const SizedBox(height: 5),
                        SmallCustomShapeField(controller: x),
                      ],
                    ),
                    const SizedBox(width: 5),
                    Column(
                      children: [
                        const Text('age'),
                        const SizedBox(height: 5),
                        Customdrop(controller: x),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Center(
                  child: CustomButton(
                    onPressed: () async {
                      try {
                        var response = await dio.post(
                          '${Globals.link}/verify-otp',
                          data: {
                            'phone': phonenum.text,
                            'password': password.text,
                            "otp": otp.text,
                          },
                        );
                        print('done');
                      } catch (e) {
                        print('Error: $e');
                      }
                    },
                    text: 'Confirm',
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
