abstract class TestItem {
  const TestItem({
    required this.itemType,
  });

  final TestItemType itemType;
}

abstract class TestQuestionsCategory<T> extends TestItem {
  const TestQuestionsCategory({
    required this.title,
    required this.categoriesChildren,
    this.resultValueKey,
  }) : super(itemType: TestItemType.category);

  final bool categoriesChildren;
  final String? title, resultValueKey;

  List<T> get children;

  int get questionsCount;
}

class TestQuestionsCategoryOfCategories
    extends TestQuestionsCategory<TestQuestionsCategory> {
  const TestQuestionsCategoryOfCategories({
    required super.title,
    required List<TestQuestionsCategory> children,
    super.resultValueKey,
  })  : _children = children,
        super(categoriesChildren: true);

  final List<TestQuestionsCategory> _children;

  @override
  List<TestQuestionsCategory> get children => _children;

  @override
  int get questionsCount {
    int childrenCount = 0;
    for (var category in _children) {
      childrenCount += category.questionsCount;
    }
    return childrenCount;
  }
}

class TestQuestionsSimpleCategory extends TestQuestionsCategory<TestQuestion> {
  const TestQuestionsSimpleCategory({
    required super.title,
    required List<TestQuestion> children,
    super.resultValueKey,
  })  : _children = children,
        super(categoriesChildren: false);

  final List<TestQuestion> _children;

  @override
  List<TestQuestion> get children => _children;

  @override
  int get questionsCount => _children.length;
}

abstract class TestQuestion extends TestItem {
  const TestQuestion({required this.question})
      : super(itemType: TestItemType.question);
  final String question;
}

class TestQuestionCheck extends TestQuestion {
  const TestQuestionCheck({required super.question});
}

enum TestItemType {
  category,
  question,
}

enum TestItemViewMode {
  /// Every item will be shown in its own page with left and right arrows to
  /// move beetween them
  paged,

  /// Every item will be showed in the main list
  separated,
}
