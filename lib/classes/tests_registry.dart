import 'package:multitests/classes/test_class.dart';

export 'package:multitests/classes/test_class.dart';

/// A registry for the tests in this app.
class TestRegistry {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  TestRegistry._();
  static List<Test>? _tests = [];

  static void addMultiTest(Test test) {
    _tests ??= <Test>[];
    _tests!.add(test);
  }

  /// Get all registered tests
  static List<Test> get registeredTests => _tests ?? [];
}
