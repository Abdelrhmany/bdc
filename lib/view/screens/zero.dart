import 'package:flutter/material.dart';
import 'package:bdc/view/componants/button.dart';

import '../../generated/l10n.dart';
import '../../main.dart';
import 'loginscreen.dart';

class Zero extends StatefulWidget {
  const Zero({super.key});

  @override
  State<Zero> createState() => _ZeroState();
}

class _ZeroState extends State<Zero> {
  @override
  bool _isEnglish = true;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/zero.png'),
          const SizedBox(height: 30),
          Text(
            S.of(context).Explortheapp,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            'Explor the app!',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          CustomButton(
            text: S.of(context).letsstarte,
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => Loginscreen()));
            },
          ),
        ],
      ),
    );
  }
}
