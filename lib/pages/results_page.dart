import 'package:flutter/material.dart';
import 'package:multitests/classes/test_result.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.testResult, {super.key});

  final TestResult testResult;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              testResult.resultMessage,
              style: theme.textTheme.displayMedium,
            ),
            if (testResult.resultType != null)
              Text(
                testResult.resultType!.name,
                style: theme.textTheme.displaySmall,
              ),
            if (testResult.resultType?.widget != null)
              testResult.resultType!.widget!,
            if (testResult.resultValue != null)
              Text(
                testResult.resultValue!.toString(),
                style: theme.textTheme.bodyLarge,
              ),
          ],
        ),
      ),
    );
  }
}
