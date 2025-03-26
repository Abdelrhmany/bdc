import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bdc/controllers/gitsurvfromapi.dart';
import 'package:bdc/controllers/global.dart';

import '../componants/button.dart';
import '../componants/multichose.dart';
import '../componants/textQuistion.dart';

class Quistion extends StatefulWidget {
  const Quistion({super.key});

  @override
  State<Quistion> createState() => _QuistionState();
}

class _QuistionState extends State<Quistion> {
  bool isLoading = true; 
  List<String> ids = [];
  String jsondata = "";
  late String res;

  @override
  void initState() {
    super.initState();
    res = "{$jsondata}";
    loadData(); // ✅ استدعاء الفانكشن اللي بتجيب البيانات
  }

  Future<void> loadData() async {
    await getdata(ids); // ✅ انتظار تحميل البيانات
    setState(() {
      isLoading = false; // ✅ تحديث الحالة بعد انتهاء التحميل
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/buttom.png'),
            ),
            Column(
              children: [
                SizedBox(
                  height: 189,
                  width: 134,
                  child: Image.asset('assets/topone.png'),
                ),

                if (isLoading)
                  Expanded(child: Center(child: CircularProgressIndicator()))
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: Globals.allquistions.length,
                      itemBuilder: (context, index) {
                        var question = Globals.allquistions[index];
                        ids.add(question['_id']);

                        return Column(
                          children: List.generate(
                            question['questions'].length,
                            (i) {
                              var squ = question['questions'][i];

                              return squ['type'] == 'text'
                                  ? Textquistion(
                                    quistion: squ['question']['ar'],
                                    jsondata: "",
                                    id: squ['_id'],
                                  )
                                  : Multichose(
                                    quistion: squ['question']['ar'],
                                    answers: squ['options'],
                                  );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 20),
                CustomButton(
                  onPressed: () {
                    // Globals globals = Globals();
                    // globals.saveExcludedIds(ids);
                    // print(ids);
                    print(jsondata+'===='+res);
                  },
                  text: 'Submit',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
