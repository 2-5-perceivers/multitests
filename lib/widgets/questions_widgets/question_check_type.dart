import 'package:flutter/material.dart';
import 'package:multitests/classes/test_provider.dart';

class WQCheck extends StatefulWidget {
  const WQCheck(this.question, this.valueKey, {super.key});

  final TestQuestionCheck question;
  final String valueKey;

  @override
  State<WQCheck> createState() => _WQCheckState();
}

class _WQCheckState extends State<WQCheck> {
  late bool checkValue;

  @override
  Widget build(BuildContext context) {
    checkValue = TestProvider.of(context).getBoolValue(
      widget.valueKey,
      widget.question.question,
    );
    return ListTile(
      title: Text(widget.question.question),
      trailing: Transform.scale(
        scale: 1.2,
        child: Checkbox(
          onChanged: (value) {
            setState(() {
              TestProvider.of(context).setBool(
                widget.valueKey,
                widget.question.question,
                value!,
              );
            });
          },
          value: checkValue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          checkColor: Theme.of(context).colorScheme.onPrimaryContainer,
          fillColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
      ),
    );
  }
}
