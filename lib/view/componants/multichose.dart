import 'package:flutter/material.dart';

class Multichose extends StatelessWidget {
  Multichose({super.key, required this.quistion, required this.answers});
  bool answerd = false;
  String quistion;
  List answers;
  clic() {
    if (answerd == false) {}
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Container(
          width: 336,
          height: 45,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(217, 217, 217, 1), spreadRadius: 3),
            ],
          ),
          child: Center(
            child: Text(
              quistion,
              style: const TextStyle(
                  color: Color.fromRGBO(68, 68, 68, 1),
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    width: 140,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(217, 217, 217, 1),
                            spreadRadius: 3),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        answers[0],
                        style: const TextStyle(
                            color: Color.fromRGBO(68, 68, 68, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 140,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          spreadRadius: 3),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      answers[1],
                      style: const TextStyle(
                          color: Color.fromRGBO(68, 68, 68, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          spreadRadius: 3),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      answers[2],
                      style: const TextStyle(
                          color: Color.fromRGBO(68, 68, 68, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 140,
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromRGBO(217, 217, 217, 1),
                          spreadRadius: 3),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      answers[3],
                      style: const TextStyle(
                          color: Color.fromRGBO(68, 68, 68, 1),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}



// import 'package:flutter/material.dart';

// class Multichose extends StatelessWidget {
//   Multichose({super.key, required this.quistion, required this.answers});

//   String quistion;
//   List<String> answers;

//   Widget build(BuildContext context) {
//     return Column(
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
//               quistion,
//               style: const TextStyle(
//                   color: Color.fromRGBO(68, 68, 68, 1),
//                   fontSize: 17,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       GridView.builder(
//   shrinkWrap: true,
//   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2, // number of items in each row
//     mainAxisSpacing: 8.0, // spacing between rows
//     crossAxisSpacing: 8.0, // spacing between columns
//   ),
//   padding: const EdgeInsets.all(8.0), // padding around the grid
//   itemCount: answers.length, // total number of items
//   itemBuilder: (context, index) {
//     return Container(
//       width: 160, // العرض المطلوب
//       height: 45, // الارتفاع المطلوب
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromRGBO(217, 217, 217, 1),
//             spreadRadius: 3,
//           ),
//         ],
//       ),
//       child: Center(
//         child: Text(
//           answers[index],
//           style: const TextStyle(
//             color: Color.fromRGBO(68, 68, 68, 1),
//             fontSize: 17,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   },
// );



//             // return SizedBox(
//             //   width: 160,
//             //   height: 45,
//             //   child: Container(
//             //     width: 160,
//             //     height: 45,
//             //     decoration: BoxDecoration(
//             //       color: const Color.fromARGB(255, 255, 255, 255),
//             //       borderRadius: BorderRadius.circular(
//             //         10,
//             //       ),
//             //       boxShadow: const [
//             //         BoxShadow(
//             //             color: Color.fromRGBO(217, 217, 217, 1),
//             //             spreadRadius: 3),
//             //       ],
//             //     ),
//             //     child: Center(
//             //       child: Text(
//             //         answers[index],
//             //         style: const TextStyle(
//             //             color: Color.fromRGBO(68, 68, 68, 1),
//             //             fontSize: 17,
//             //             fontWeight: FontWeight.bold),
//             //       ),
//             //     ),
//             //   ),
//             // );
//           },
//         )
//       ],
//     );
//   }
// }
