import 'package:flutter/material.dart';
import 'package:quiz/shared/styles/colors.dart';

class Answer extends StatelessWidget {
  const Answer({Key? key, required this.value, required this.press})
      : super(key: key);
  final String value;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                color: bg,
              ),
            ),
          )),
    );
  }
}
