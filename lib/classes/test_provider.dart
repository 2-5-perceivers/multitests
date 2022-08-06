import 'package:flutter/material.dart';
import 'package:multitests/classes/question_response.dart';
import 'package:multitests/classes/tests_registry.dart';
import 'package:provider/provider.dart';

export 'package:multitests/classes/tests_registry.dart';

class TestProvider {
  TestProvider(this.testID);

  final String testID;
  late Test test;
  late List<TestQuestionsCategory> categories;
  late bool paged;

  late Map<String, QuestionResponse> responseRegister;

  Future<Test> loadTest() async {
    try {
      test = TestRegistry.registeredTests.firstWhere(
        (element) => element.id == testID,
      );
    } catch (_) {
      rethrow;
    }

    List<TestQuestion> abandonedQuestions = [];
    categories = [];

    for (var i = 0; i < test.testQuestions.length; i++) {
      if (test.testQuestions[i].itemType == TestItemType.question) {
        abandonedQuestions.add(test.testQuestions[i] as TestQuestion);
      } else {
        categories.add(test.testQuestions[i] as TestQuestionsCategory);
      }
    }

    if (abandonedQuestions.isNotEmpty) {
      categories.add(
        TestQuestionsSimpleCategory(
          title: null,
          resultValueKey: '',
          children: abandonedQuestions,
        ),
      );
    }

    paged = test.itemsViewMode == TestItemViewMode.paged;

    responseRegister = {};

    return test;
  }

  bool getBoolValue(String valueKey, String questionKey) {
    return (responseRegister['$valueKey.$questionKey']?.boolChoice ?? false);
  }

  void setBool(String valueKey, String questionKey, bool newValue, int value) {
    responseRegister['$valueKey.$questionKey'] = QuestionResponse(
      valueKey,
      value,
      boolChoice: newValue,
    );
  }

  TestResult finnish() {
    return test.resultCalculator(responseRegister);
  }

  void dispose() {
    categories.clear();
    responseRegister.clear();
  }

  static TestProvider of(BuildContext context) {
    return Provider.of<TestProvider>(context, listen: false);
  }
}
