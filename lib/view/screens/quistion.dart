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
  bool isLoading = true; // ✅ متغير لمعرفة حالة تحميل البيانات
  List<String> ids = [];
  @override
  void initState() {
    super.initState();
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

                // ✅ عرض "جاري التحميل" لو البيانات لسه محملة
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
                    Globals globals = Globals();
                    globals.saveExcludedIds(ids);
                    print(ids);
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

// import 'package:flutter/material.dart';
// import 'package:newprojectmobilw/global.dart';

// import '../componants/button.dart';
// import '../componants/multichose.dart';
// import '../componants/textQuistion.dart';

// class Quistion extends StatelessWidget {
//   const Quistion({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(left: 15, right: 15),
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Image.asset('assets/buttom.png'),
//             ),
//             SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Container(
//                     height: 189,
//                     width: 134,
//                     child: Image.asset(
//                       'assets/topone.png',
//                     ),
//                   ),
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         //   Center(
//                         //     child:
//                         //         Textquistion(quistion: 'quistion', jsondata: ''),
//                         //   ),
//                         //   const SizedBox(
//                         //     height: 20,
//                         //   ),
//                         //   Center(
//                         //       child: Multichose(
//                         //     quistion: 'how old are you',
//                         //     answers: ['1', '2', '3', '4'],
//                         //   )),
//                         Flexible(
//                           child: ListView.builder(
//                             itemCount: Globals
//                                 .allquistions.length, // عدد العناصر في القائمة
//                             itemBuilder: (context, index) {
//                               var questions = Globals.allquistions[index]
//                                   ['questions'][0]['question']['ar'];
//                               // الحصول على السؤال باللغة العربية من الكائن

//                               return ListTile(
//                                 title: ElevatedButton(
//                                     onPressed: () {
//                                       print(questions);
//                                     },
//                                     child: Text(
//                                         'data')), // عرض السؤال باللغة العربية
//                               );
//                             },
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         CustomButton(
//                           onPressed: () {
//                             var x = Globals.allquistions[0]['questions'][0]
//                                 ['question']['ar'];
//                             print(x);
//                           },
//                           text: 'Susubmit',
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
