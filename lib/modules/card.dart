import 'package:flutter/material.dart';
import 'package:quiz/shared/styles/colors.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({Key? key, required this.index, required this.txt})
      : super(key: key);
  final int index;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .35,
          decoration: BoxDecoration(
            color: white,
            boxShadow: const [
              BoxShadow(
                color: shadow,
                offset: Offset(.5, .5),
                blurRadius: 4,
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Text(
                txt,
                style: const TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              ),
            )
          ]),
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: primary,
          child: Center(
              child: Text(
            "$index",
            style: const TextStyle(color: bg, fontSize: 22),
          )),
        )
      ],
    );
  }
}
