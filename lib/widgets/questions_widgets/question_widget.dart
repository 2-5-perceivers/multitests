import 'package:flutter/material.dart';
import 'package:multitests/classes/test_class.dart';
import 'package:multitests/widgets/questions_widgets/question_check_type.dart';

class WQuestionWidget extends StatelessWidget {
  const WQuestionWidget(this.question, this.valueKey, {super.key});

  final TestQuestion question;
  final String valueKey;

  @override
  Widget build(BuildContext context) {
    return <Type, Widget>{
      TestQuestionCheck: WQCheck(question as TestQuestionCheck, valueKey),
    }[question.runtimeType]!;
  }
}
