import 'package:flutter/material.dart';
import 'package:multitests/classes/test_items.dart';
import 'package:multitests/widgets/questions_widgets/question_widget.dart';

class WQCategoryCard extends StatelessWidget {
  const WQCategoryCard(this.category, {this.overrideValueKey, super.key});

  final TestQuestionsCategory category;

  final String? overrideValueKey;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 1000,
          ),
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: theme.colorScheme.surfaceTint.withOpacity(0.03),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (category.title != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        category.title!,
                        style: theme.textTheme.headlineMedium,
                      ),
                    ),
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      if (category.categoriesChildren) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: WQCategoryCard(
                            category.children[index] as TestQuestionsCategory,
                            overrideValueKey:
                                category.resultValueKey ?? overrideValueKey,
                          ),
                        );
                      } else {
                        return WQuestionWidget(
                          category.children[index] as TestQuestion,
                          category.resultValueKey ?? overrideValueKey ?? '',
                        );
                      }
                    },
                    itemCount: category.children.length,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
