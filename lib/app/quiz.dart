import 'package:flutter/material.dart';

import '../consts.dart';
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
                  child: RaisedButton(
                    color: primary,
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
                )
              : QuizBody(),
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
  final List<Map<String, Object>> _quests = [
    {
      'text': 'Do you love cats?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'Do you love Dogs?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'are you crazy man?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'Do you love your sister?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'Do you hate school?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'are you a woman?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'are you a man?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'Do you love hunters?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'Do you onepiece?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
    {
      'text': 'Do you conan?',
      'answer': [
        {'txt': 'yes', 'score': 10},
        {'txt': 'no', 'score': 5},
      ]
    },
  ];
  pressed(int score) {
    total += score;
    setState(() {
      current += 1;
      if (current == _quests.length + 1) {
        current -= 1;
        result();
      }
    });
    print("$score -> then : $total");
  }

  result() {
    if (0 <= total && total <= 45) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: bg,
                alignment: Alignment.center,
                title: const Icon(smile, color: primary, size: 45),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'you are bad',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10,),
                    Text("your score is: $total"),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => const Quiz()));
                          transitionDuration:
                          Duration.zero;
                        },
                        icon: const Icon(
                          Icons.restart_alt_rounded,
                          color: primary,
                          size: 22,
                        ))
                  ],
                ),
              ));
    } else if (45 < total && total <= 75) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: bg,
                alignment: Alignment.center,
                title: const Icon(smile, color: primary, size: 45),
                content: Column(
                  
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'you are good',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("your score is: $total"),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => const Quiz()));
                          transitionDuration:
                          Duration.zero;
                        },
                        icon: const Icon(
                          Icons.restart_alt_rounded,
                          color: primary,
                          size: 22,
                        ))
                  ],
                ),
              ));
    } else {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                backgroundColor: bg,
                alignment: Alignment.center,
                title: const Icon(smile, color: primary, size: 45),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'you are excellent',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10,),
                    Text("your score is: $total"),
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) => const Quiz()));
                          transitionDuration:
                          Duration.zero;
                        },
                        icon: const Icon(
                          Icons.restart_alt_rounded,
                          color: primary,
                          size: 22,
                        ))
                  ],
                ),
              ));
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
                for (int i = 1; i < _quests.length + 1; i++) //15  /14 /15
                  Padding(padding: const EdgeInsets.all(8.0), child: circles(i))
              ],
            ),
          ),
          free,
          //card_q
          QuestionCard(
            index: current,
            txt: _quests[current - 1]['text'] as String,
          ),
          free,
          //answers
          ...(_quests[current - 1]['answer'] as List<Map<String, Object>>)
              .map((e) => Answer(
                  value: e['txt'] as String,
                  press: () => pressed(e['score'] as int)))
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
    return Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: primary,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              "$index",
              style: TextStyle(color: primary),
            )),
          ),
        ));
  }

  Widget wait(int index) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "$index",
          style: TextStyle(color: bg),
        ),
      ),
    );
  }

  Widget notSeen(int index) {
    return Container(
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
          color: gry,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
              color: bg,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: Text(
              "$index",
              style: TextStyle(color: gry),
            )),
          ),
        ));
  }
}
