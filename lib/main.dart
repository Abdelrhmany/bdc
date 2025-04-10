import 'package:bdc/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bdc/view/screens/buttomnavbar.dart';
import 'package:bdc/view/screens/earn.dart';
import 'package:bdc/view/screens/joinchanels.dart';
import 'package:bdc/view/screens/zero.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'controllers/gitsurvfromapi.dart';
import 'controllers/global.dart';
import 'view/componants/multichose.dart';
import 'view/componants/textQuistion.dart';
import 'view/screens/forgetPassword.dart';
import 'view/screens/invite.dart';
import 'view/screens/loginscreen.dart';
import 'view/screens/quistion.dart';
import 'view/screens/register.dart';
import 'view/screens/resetPassword.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  runApp(
    DevicePreview(
      enabled:true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLanguage(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', 'US'); 
void initState()   {
    super.initState();
      } 
Future<void> _initializeAsyncOperations() async {
  await Globals().fetchLinkFromApi(); 
  await Globals().getAllQuestions;
} 
void changeLanguage(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const Invite(),
    );
  }
}
