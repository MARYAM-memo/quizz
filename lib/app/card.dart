import 'package:flutter/material.dart';

import '../consts.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.index, required this.txt}) : super(key: key);
  final int index;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: white, boxShadow: [
        BoxShadow(
          color: shadow,
          offset: Offset(0, 1),
          blurRadius: 4,
        )
      ]),
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: primary,
            height: 30,
            width: 50,
            child:  Center(
              child: Text(
                "Q:$index",
                style: const TextStyle(color: bg, fontSize: 20),
              ),
            ),
          ),
        ),
         Expanded(
           child: Text(
            txt,
            style: const TextStyle(fontSize: 22),
                 ),
         )
      ]),
    );
  }
}
