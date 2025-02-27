// import 'package:flutter/material.dart';
// import 'package:newprojectmobilw/componants/button.dart';

// class Textquistion extends StatefulWidget {
//   @override
//   Textquistion({required this.quistion, required this.jsondata});
//   String quistion;
//   String jsondata;

//   @override
//   State<Textquistion> createState() => _TextquistionState();
// }

// class _TextquistionState extends State<Textquistion> {
//   bool answerd = false;

//   TextEditingController tx = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           width: 336,
//           height: 45,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             borderRadius: BorderRadius.circular(
//               10,
//             ),
//             boxShadow: const [
//               BoxShadow(
//                   color: Color.fromRGBO(217, 217, 217, 1), spreadRadius: 3),
//             ],
//           ),
//           child: Center(
//             child: Text(
//               widget.quistion,
//               style: const TextStyle(
//                   color: Color.fromRGBO(68, 68, 68, 1),
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         const Text(
//           'Answer',
//           style: TextStyle(
//               color: Color.fromRGBO(68, 68, 68, 1),
//               fontSize: 17,
//               fontWeight: FontWeight.bold),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Container(
//           width: 336,
//           height: 76,
//           decoration: BoxDecoration(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: const [
//               BoxShadow(
//                 color: Color.fromRGBO(217, 217, 217, 1),
//                 spreadRadius: 3,
//               ),
//             ],
//           ),
//           child: const Center(
//             child: TextField(
//               maxLines: null,
//               minLines: 1,
//               keyboardType: TextInputType.multiline,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ),
//         CustomButton(
//             text: answerd == false ? 'answer' : 'answered!',
//             onPressed: () {
//               widget.jsondata + tx.text;
//               setState(() {
//                 answerd = true;
//               });
//               print(widget.jsondata.toString());
//             })
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bdc/view/componants/button.dart';

class Textquistion extends StatefulWidget {
  @override
  Textquistion({required this.quistion, required this.jsondata});
  String quistion;
  String jsondata;

  @override
  State<Textquistion> createState() => _TextquistionState();
}

class _TextquistionState extends State<Textquistion> {
  bool answerd = false;

  TextEditingController tx = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 336,
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(217, 217, 217, 1),
                spreadRadius: 3,
              ),
            ],
          ),
          child: Center(
            child: Text(
              widget.quistion,
              style: const TextStyle(
                color: Color.fromRGBO(68, 68, 68, 1),
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Answer',
          style: TextStyle(
            color: Color.fromRGBO(68, 68, 68, 1),
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 336,
          height: 76,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(217, 217, 217, 1),
                spreadRadius: 3,
              ),
            ],
          ),
          child: Center(
            child: TextField(
              controller: tx,
              maxLines: null,
              minLines: 1,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
        SizedBox(height: 15),
        CustomButton(
          text: answerd == false ? 'answer' : 'answered!',
          onPressed: () {
            if (answerd == false) {
              setState(() {
                widget.jsondata += tx.text;
                answerd = true;
              });
              print(widget.jsondata);
            } else {
              print('soory you are answerd befor');
            }
            // الطباعة هنا لعرض المحتوى الجديد
          },
        ),
      ],
    );
  }
}
