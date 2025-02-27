import 'package:flutter/material.dart';
import 'package:bdc/controllers/global.dart';
import 'package:bdc/view/componants/customtextfield.dart';
import '../componants/button.dart';
import 'package:dio/dio.dart';

class Invite extends StatefulWidget {
  const Invite({super.key});

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  bool _imagesLoaded = false;
  bool _isLoadingImages = false; // لتجنب إعادة تحميل الصور أكثر من مرة

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

  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _imagesLoaded
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
                        child: CustomTextField(
                          controller: phoneController,
                          hintText: "enter phone number",
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
                                data: {'phone': '${phoneController.text}'},
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




// import 'package:flutter/material.dart';
// import '../componants/button.dart';

// class Invite extends StatefulWidget {
//   const Invite({super.key});

//   @override
//   State<Invite> createState() => _InviteState();
// }

// class _InviteState extends State<Invite> {
//   bool _imagesLoaded = false; // متغير لمعرفة ما إذا كانت الصور قد تم تحميلها

//   @override
//   void initState() {
//     super.initState();
//     _precacheImages(); // استدعاء تحميل الصور
//   }

//   Future<void> _precacheImages() async {
//     await Future.wait([
//       precacheImage(const AssetImage('assets/bottomjoin.png'), context),
//       precacheImage(const AssetImage('assets/topone.png'), context),
//     ]);

//     setState(() {
//       _imagesLoaded = true; // تحديث الحالة بعد تحميل الصور
//     });

//     print("✅ جميع الصور تم تحميلها مسبقًا!");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _imagesLoaded
//           ? Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Image.asset('assets/bottomjoin.png'),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 150,
//                       width: 134,
//                       child: Image.asset('assets/topone.png'),
//                     ),
//                     const SizedBox(height: 100),
//                     const Text(
//                       'Invite Friends',
//                       style:
//                           TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 20),
//                     CustomButton(
//                       onPressed: () {},
//                       text: 'Invite',
//                     )
//                   ],
//                 ),
//               ],
//             )
//           : const Center(
//               child: CircularProgressIndicator()), // إظهار لودر أثناء التحميل
//     );
//   }
// }



