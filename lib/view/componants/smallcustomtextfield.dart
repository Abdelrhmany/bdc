import 'package:flutter/material.dart';

class SmallCustomShapeField extends StatelessWidget {
  final TextEditingController controller;

  SmallCustomShapeField({required this.controller});

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
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          style: TextStyle(fontSize: 14),
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



// import 'package:flutter/material.dart';

// class SmallCustomShapeField extends StatelessWidget {
//   final TextEditingController
//       controller; // المتغير لتمرير TextEditingController

//   // المنشئ لاستقبال الـ controller
//   SmallCustomShapeField({required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       size: Size(113, 35),
//       painter: RectanglePainter(),
//       child: Container(
//         width: 113,
//         height: 35,
//         alignment: Alignment.center,
//         child: TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             border: InputBorder.none, // إزالة الحدود لتناسب الشكل
//             contentPadding: EdgeInsets.zero, // إزالة الحشو
//           ),
//           style: TextStyle(fontSize: 14), // تغيير حجم الخط إذا لزم الأمر
//         ),
//       ),
//     );
//   }
// }

// // كود الرسم الذي يعادل الـ Drawable
// class RectanglePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.fill;

//     final strokePaint = Paint()
//       ..color = Color(0xFFD9D9D9)
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;

//     final path = Path()
//       ..moveTo(10, 0)
//       ..lineTo(103, 0)
//       ..cubicTo(108.523, 0, 113, 4.47715, 113, 10)
//       ..lineTo(113, 25)
//       ..cubicTo(113, 30.5228, 108.523, 35, 103, 35)
//       ..lineTo(10, 35)
//       ..cubicTo(4.47715, 35, 0, 30.5228, 0, 25)
//       ..lineTo(0, 10)
//       ..cubicTo(0, 4.47715, 4.47715, 0, 10, 0)
//       ..close();

//     canvas.drawPath(path, paint);
//     canvas.drawPath(path, strokePaint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
