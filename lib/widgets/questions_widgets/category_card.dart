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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Card(
        color: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.05),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (category.title != null)
                Text(
                  category.title!,
                  style: theme.textTheme.headlineSmall,
                ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  if (category.categoriesChildren) {
                    return WQCategoryCard(
                      category.children[index] as TestQuestionsCategory,
                      overrideValueKey:
                          category.resultValueKey ?? overrideValueKey,
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
    );
  }
}
