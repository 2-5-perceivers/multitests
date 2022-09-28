import 'package:flutter/material.dart';
import 'package:multitests/classes/multi_icons_icons.dart';
import 'package:multitests/classes/question_response.dart';
import 'package:multitests/classes/test_items.dart';
import 'package:multitests/classes/test_result.dart';

export 'package:multitests/classes/test_result.dart';
export 'package:multitests/classes/test_items.dart';

class Test {
  const Test({
    required this.id,
    required this.version,
    required this.resultCalculator,
    required this.testName,
    required this.testDescription,
    required this.testDuration,
    required this.testQuestions,
    required this.testCategories,
    required this.testResultDescriber,
    this.testDataCollections = const [],
    this.testSuggestions = const [],
    this.itemsViewMode = TestItemViewMode.separated,
    this.testAuthor =
        const TestAuthor('2.5 Perceivers', 'https://github.com/2-5-perceivers'),
  });
  final String testName, testDescription, id, version;
  final Duration testDuration;
  final TestAuthor testAuthor;
  final TestItemViewMode itemsViewMode;
  final TestResultDescriber testResultDescriber;
  final List<TestItem> testQuestions;
  final List<TestCategory> testCategories;
  final List<TestDataCollection> testDataCollections;
  final List<String> testSuggestions;

  final ResultCalculator resultCalculator;

  String get testUrl => 'https://adorkw.home.ro/multitests/#/test/$id';

  int get questionsNumber {
    int count = 0;
    for (var item in testQuestions) {
      if (item.itemType == TestItemType.category) {
        count += (item as TestQuestionsCategory).questionsCount;
      } else {
        count++;
      }
    }
    return count;
  }
}

typedef ResultCalculator = TestResult Function(
    Map<String, QuestionResponse> responseMap);

class TestAuthor {
  const TestAuthor(this.name, this.authorWebpage);
  final String name, authorWebpage;
}

enum TestCategory {
  explicit('Explicit', Icons.explicit),
  maturity('Maturity', Icons.school),
  nonScientific('Non-scientific', MultiIcons.nonScience);

  const TestCategory(this.title, this.icon);
  final String title;
  final IconData icon;
}

enum TestDataCollection {
  ethnicity('ethnicity', 'Collects simple data about your ethnicity'),
  personality('personality', 'Might collect the result of this test');

  const TestDataCollection(this.shortDescrption, this.longDescription);
  final String shortDescrption, longDescription;
}
