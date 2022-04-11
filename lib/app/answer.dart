import 'package:flutter/material.dart';
import 'package:quiz/consts.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.value, required this.press}) : super(key: key);
  final String value;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: press,
        child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                value,
                style: const TextStyle(
                  color: bg,
                ),
              ),
            )),
      ),
    );
  }
}
