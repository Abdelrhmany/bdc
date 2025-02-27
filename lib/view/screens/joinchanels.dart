import 'package:flutter/material.dart';
import 'package:bdc/controllers/global.dart';

class JoinChannels extends StatefulWidget {
  const JoinChannels({super.key});

  @override
  State<JoinChannels> createState() => _JoinChannelsState();
}

class _JoinChannelsState extends State<JoinChannels> {
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
      precacheImage(const AssetImage('assets/subscribe.png'), context),
      precacheImage(const AssetImage('assets/topone.png'), context),
      precacheImage(const AssetImage('assets/wachyoutube.png'), context),
      precacheImage(const AssetImage('assets/subscribeyou.png'), context),
      precacheImage(const AssetImage('assets/telegram.png'), context),
      precacheImage(const AssetImage('assets/xvedio.png'), context),
      precacheImage(const AssetImage('assets/joinx.png'), context),
    ]);

    if (mounted) {
      setState(() {
        _imagesLoaded = true;
      });
    }

    print("✅ جميع الصور تم تحميلها مسبقًا!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _imagesLoaded
              ? Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset('assets/subscribe.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 189,
                          width: 134,
                          child: Image.asset('assets/topone.png'),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Globals().openLink(
                              'https://youtu.be/QaUZ9LUSsbA?si=ngWRQK51i4ssQwCA',
                            );
                          },
                          child: Image.asset('assets/wachyoutube.png'),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Globals().openLink(
                              'https://www.youtube.com/@BigDataCoins',
                            );
                          },
                          child: Image.asset('assets/subscribeyou.png'),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Globals().openLink('https://t.me/bigdatacoins');
                          },
                          child: Image.asset('assets/telegram.png'),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Globals().openLink(
                              'https://x.com/bigdatacoin/status/1887241605213524032',
                            );
                          },
                          child: Image.asset('assets/xvedio.png'),
                        ),
                        const SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Globals().openLink('https://x.com/bigdatacoin');
                          },
                          child: Image.asset('assets/joinx.png'),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              )
              : const Center(child: CircularProgressIndicator()),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:newprojectmobilw/controllers/global.dart';

// class JoinChannels extends StatefulWidget {
//   const JoinChannels({super.key});

//   @override
//   State<JoinChannels> createState() => _JoinChannelsState();
// }

// class _JoinChannelsState extends State<JoinChannels> {
//   bool _imagesLoaded = false; // متغير لمعرفة ما إذا كانت الصور قد تم تحميلها

//   @override
//   void initState() {
//     super.initState();
//     _precacheImages(); // استدعاء تحميل الصور
//   }

//   Future<void> _precacheImages() async {
//     await Future.wait([
//       precacheImage(const AssetImage('assets/subscribe.png'), context),
//       precacheImage(const AssetImage('assets/topone.png'), context),
//       precacheImage(const AssetImage('assets/wachyoutube.png'), context),
//       precacheImage(const AssetImage('assets/subscribeyou.png'), context),
//       precacheImage(const AssetImage('assets/telegram.png'), context),
//       precacheImage(const AssetImage('assets/xvedio.png'), context),
//       precacheImage(const AssetImage('assets/joinx.png'), context),
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
//                   child: Image.asset(
//                     'assets/subscribe.png',
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30, right: 30),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 189,
//                         width: 134,
//                         child: Image.asset(
//                           'assets/topone.png',
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       InkWell(
//                           onTap: () {
//                             Globals().openLink(
//                                 'https://youtu.be/QaUZ9LUSsbA?si=ngWRQK51i4ssQwCA');
//                           },
//                           child: Image.asset('assets/wachyoutube.png')),
//                       const SizedBox(height: 10),
//                       Image.asset('assets/subscribeyou.png'),
//                       const SizedBox(height: 10),
//                       Image.asset('assets/telegram.png'),
//                       const SizedBox(height: 10),
//                       Image.asset('assets/xvedio.png'),
//                       const SizedBox(height: 10),
//                       Image.asset('assets/joinx.png'),
//                       const SizedBox(height: 10),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           : const Center(
//               child: CircularProgressIndicator()), // إظهار لودر أثناء التحميل
//     );
//   }
// }
