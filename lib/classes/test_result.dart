import 'package:flutter/widgets.dart';

class TestResult {
  const TestResult(
    this.resultMessage, {
    this.resultValue,
    this.resultType,
  });

  final String resultMessage;
  final int? resultValue;
  final TestResultType? resultType;
}

class TestResultType {
  const TestResultType(this.name, this.widget);

  final String name;
  final Widget? widget;
}

class TestResultDescriber {
  TestResultDescriber({
    this.possibleValues,
    this.minValue,
    this.maxValue,
  });

  final List<String>? possibleValues;
  final double? minValue, maxValue;
}
