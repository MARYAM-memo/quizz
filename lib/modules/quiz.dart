import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/shared/components/constants.dart';
import 'package:quiz/shared/components/shared_widgets.dart';
import 'package:quiz/shared/styles/colors.dart';
import 'answer.dart';
import 'card.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: primary,
          title: const Center(
              child: Text(
            "quiz page",
            style: TextStyle(color: bg),
          )),
        ),
        body: SafeArea(
          child: show == false
              ? Column(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'ًWe need you to answer some questions to get the best results. ',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: gry, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: primary,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15)),
                          onPressed: () {
                            setState(() {
                              show = true;
                            });
                          },
                          child: const Text(
                            "Start",
                            style: TextStyle(color: bg, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const QuizBody(),
        ));
  }
}

class QuizBody extends StatefulWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int current = 1;
  int total = 0;
  inPressedAction(int score) {
    total += score;
    setState(() {
      current += 1;
      if (current == quests.length + 1) {
        current -= 1;
        showResult();
      }
    });
    if (kDebugMode) {
      print("$score -> then : $total");
    }
  }

  showResult() {
    if (0 <= total && total <= 45) {
      return resultInDialogBox(
          ctx: context, icon: frown, txtState: 'you are bad', total: total);
    } else if (45 < total && total <= 75) {
      return resultInDialogBox(
          ctx: context, icon: meh, txtState: 'you are good', total: total);
    } else {
      return resultInDialogBox(
          ctx: context,
          icon: smile,
          txtState: 'you are excellent',
          total: total);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //nums
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 1; i < quests.length + 1; i++) //15  /14 /15
                  Padding(
                      padding: const EdgeInsets.all(2.5),
                      child: chooseCirclesStyle(i))
              ],
            ),
          ),
          free(h: 60),
          //card_q
          QuestionCard(
            index: current,
            txt: quests[current - 1]['text'] as String,
          ),
          free(h: 40),
          //answers
          ...(quests[current - 1]['answer'] as List<Map<String, Object>>)
              .map((e) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Answer(
                        value: e['txt'] as String,
                        press: () => inPressedAction(e['score'] as int)),
                  ))
              .toList()
        ],
      ),
    );
  }

  Widget chooseCirclesStyle(int index) {
    if (index == current) {
      return circles(10, primary);
    } else if (index > current) {
      return circles(5, gry.withOpacity(.5));
    } else {
      return circles(5, primary);
    }
  }
}

Widget circles(double rds, color) {
  return CircleAvatar(
    radius: rds,
    backgroundColor: color,
  );
}
/*
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quiz/shared/components/constants.dart';
import 'package:quiz/shared/components/shared_widgets.dart';
import 'package:quiz/shared/styles/colors.dart';
import 'answer.dart';
import 'card.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bg,
        appBar: AppBar(
          backgroundColor: primary,
          title: const Center(
              child: Text(
            "quiz page",
            style: TextStyle(color: bg),
          )),
        ),
        body: SafeArea(
          child: show == false
              ? Center(
                  child: Container(
                    color: primary,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          show = true;
                        });
                      },
                      child: const Text(
                        "Start",
                        style: TextStyle(color: bg),
                      ),
                    ),
                  ),
                )
              : const QuizBody(),
        ));
  }
}

class QuizBody extends StatefulWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int current = 1;
  int total = 0;
  inPressedAction(int score) {
    total += score;
    setState(() {
      current += 1;
      if (current == quests.length + 1) {
        current -= 1;
        showResult();
      }
    });
    if (kDebugMode) {
      print("$score -> then : $total");
    }
  }

  showResult() {
    if (0 <= total && total <= 45) {
      return resultInDialogBox(
          ctx: context, icon: frown, txtState: 'you are bad', total: total);
    } else if (45 < total && total <= 75) {
      return resultInDialogBox(
          ctx: context, icon: meh, txtState: 'you are good', total: total);
    } else {
      return resultInDialogBox(
          ctx: context,
          icon: smile,
          txtState: 'you are excellent',
          total: total);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //nums
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 1; i < quests.length + 1; i++) //15  /14 /15
                  Padding(padding: const EdgeInsets.all(8.0), child: circles(i))
              ],
            ),
          ),
          free,
          //card_q
          QuestionCard(
            index: current,
            txt: quests[current - 1]['text'] as String,
          ),
          free,
          //answers
          ...(quests[current - 1]['answer'] as List<Map<String, Object>>)
              .map((e) => Answer(
                  value: e['txt'] as String,
                  press: () => inPressedAction(e['score'] as int)))
              .toList()
        ],
      ),
    );
  }

  Widget circles(int index) {
    if (index == current) {
      return wait(index);
    } else if (index < current) {
      return seen(index);
    } else {
      return notSeen(index);
    }
  }

  Widget seen(int index) {
    return circleDesignOfNumbers(
        color: primary,
        child: innerCircleDesignOfNumbers(index: index, color: primary));
  }

  Widget wait(int index) {
    return circleDesignOfNumbers(
      color: primary,
      child: Center(
        child: Text(
          "$index",
          style: const TextStyle(color: bg),
        ),
      ),
    );
  }

  Widget notSeen(int index) {
    return circleDesignOfNumbers(
        color: gry,
        child: Center(
            child: innerCircleDesignOfNumbers(index: index, color: gry)));
  }
}
 */