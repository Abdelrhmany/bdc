import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Earn extends StatefulWidget {
  const Earn({super.key});

  @override
  _EarnState createState() => _EarnState();
}

class _EarnState extends State<Earn> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(const AssetImage('assets/earn.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/earn.png',
            fit: BoxFit.fill,
          ),
          Center(
            child: GlowingContainer(
              number: '5',
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class Earn extends StatelessWidget {
//   const Earn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             'earn.png',
//             fit: BoxFit.fill,
//           ),
//           Positioned(
//             top: ((MediaQuery.sizeOf(context).height) / 2) + 20,
//             left: ((MediaQuery.sizeOf(context).width) / 2) - 12,
//             child: GlowingContainer(
//               number: '5',
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

class GlowingContainer extends StatefulWidget {
  final String number;
  final double size;

  const GlowingContainer({
    super.key,
    required this.number,
    this.size = 50,
  });

  @override
  _GlowingContainerState createState() => _GlowingContainerState();
}

class _GlowingContainerState extends State<GlowingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: Colors.blue.withOpacity(0.7),
      end: Colors.cyanAccent.withOpacity(1),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: _colorAnimation.value!,
                blurRadius: 20,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Text(
            widget.number,
            style: TextStyle(
              fontSize: widget.size,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: const [
                Shadow(
                  blurRadius: 10,
                  color: Colors.blueAccent,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
