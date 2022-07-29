import 'package:flutter/material.dart';
import 'package:multitests/classes/multi_icons_icons.dart';

class Test {
  const Test({
    required this.id,
    required this.testName,
    required this.testDescription,
    required this.testCategories,
  });
  final String testName, testDescription, id;
  final List<TestCategory> testCategories;

  String get testUrl => 'https://adorkw.home.ro/multitests/#/test/$id';
}

enum TestCategory {
  explicit('Explicit', Icons.explicit),
  maturity('Maturity', Icons.school),
  personality('Personality', Icons.psychology),
  scientific('Scientific', Icons.science),
  nonScientific('Non-scientific', MultiIcons.non_science);

  const TestCategory(this.title, this.icon);
  final String title;
  final IconData icon;
}
