import 'package:flutter/material.dart';

class Customdrop extends StatefulWidget {
  final TextEditingController controller;

  Customdrop({required this.controller});

  @override
  State<Customdrop> createState() => _CustomdropState();
}

class _CustomdropState extends State<Customdrop> {
  String? selectedValue; // القيمة الافتراضية null

  @override
  Widget build(BuildContext context) {
    double fieldWidth = (MediaQuery.of(context).size.width * 0.33) - 15;

    return CustomPaint(
      size: Size(fieldWidth, 35),
      painter: RectanglePainter(fieldWidth),
      child: Container(
        width: fieldWidth,
        height: 35,
        alignment: Alignment.center,
        child: DropdownButton<String>(
          value: selectedValue, // القيمة الحالية
          items: [
            DropdownMenuItem(
              value: '0-18',
              child: Container(
                width: 80,
                alignment: Alignment.center,
                child: Text('18'),
              ),
            ),
            DropdownMenuItem(
              value: '18-35',
              child: Container(
                width: 80,
                alignment: Alignment.center,
                child: Text('18-35'),
              ),
            ),
            DropdownMenuItem(
              value: '35-100',
              child: Container(
                width: 80,
                alignment: Alignment.center,
                child: Text('35-100'),
              ),
            ),
          ],
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue; // تحديث القيمة المختارة
            });
            print('Selected value: $newValue'); // طباعة القيمة الجديدة
          },
          hint: Text('Select age'), // النص الافتراضي
          icon: SizedBox.shrink(), // إزالة السهم الافتراضي
          underline: SizedBox.shrink(), // إزالة الخط السفلي
          isExpanded: false, // تعطيل التوسيع الكامل
          dropdownColor: Colors.white, // لون خلفية القائمة
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          borderRadius: BorderRadius.circular(10), // زوايا مستديرة للقائمة
        ),
      ),
    );
  }
}

class RectanglePainter extends CustomPainter {
  final double width;

  RectanglePainter(this.width);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final strokePaint = Paint()
      ..color = Color(0xFFD9D9D9)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(10, 0)
      ..lineTo(width - 10, 0)
      ..cubicTo(width - 5, 0, width, 4.47715, width, 10)
      ..lineTo(width, 25)
      ..cubicTo(width, 30.5228, width - 5, 35, width - 10, 35)
      ..lineTo(10, 35)
      ..cubicTo(4.47715, 35, 0, 30.5228, 0, 25)
      ..lineTo(0, 10)
      ..cubicTo(0, 4.47715, 4.47715, 0, 10, 0)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
