import 'package:flutter/material.dart';
import 'package:multitests/classes/tests_registry.dart';
import 'package:multitests/pages/page_404.dart';

class TestPage extends StatelessWidget {
  const TestPage(this.testID, {super.key});

  final String testID;

  @override
  Widget build(BuildContext context) {
    Test test;
    try {
      test = TestRegistry.registeredTests.firstWhere(
        (element) => element.id == testID,
      );
    } on StateError catch (e) {
      return const Page404(
        errorText: 'It seems this test does not exist.',
      );
    }
    return Title(
      title: 'MultiTests - ${test.testName}',
      color: Theme.of(context).colorScheme.primary,
      child: Scaffold(
        body: Text(test.testName),
        appBar: AppBar(),
      ),
    );
  }
}
