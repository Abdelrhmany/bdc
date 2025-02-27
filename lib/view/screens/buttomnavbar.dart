import 'package:bdc/view/screens/earn.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'invite.dart';
import 'joinchanels.dart';
import 'quistion.dart';

class Buttomnavbar extends StatefulWidget {
  @override
  _ButtomnavbarState createState() => _ButtomnavbarState();
}

class _ButtomnavbarState extends State<Buttomnavbar> {
  int _selectedIndex = 0; // لتحديد العنصر النشط

  final List<Widget> _pages = [Quistion(), JoinChannels(), Earn(), Invite()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blue[100], // تغيير لون الخلفية لرؤية التأثير بوضوح
      body: _pages[_selectedIndex], // عرض الصفحة بناءً على العنصر المحدد
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blue[100]!, // لون خلفية الشاشة
        color: Colors.white, // لون شريط التنقل
        buttonBackgroundColor: Colors.blue, // لون الزر النشط
        height: 60, // ارتفاع الشريط
        animationCurve: Curves.easeInOut, // تأثير الحركة
        animationDuration: const Duration(milliseconds: 300), // مدة الحركة
        index: _selectedIndex, // العنصر الافتراضي
        items: <Widget>[
          Image.asset('assets/quis.png', height: 30, width: 30),
          Image.asset('assets/moneybag.png', height: 30, width: 30),
          Image.asset('assets/airdrob.png', height: 30, width: 30),
          Image.asset('assets/users.png', height: 30, width: 30),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // تحديث العنصر النشط عند النقر
          });
        },
      ),
    );
  }
}
