import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitests/classes/test_class.dart';
import 'package:share_plus_dialog/share_plus_dialog.dart';

class TestTile extends StatelessWidget {
  const TestTile(
    this.test, {
    super.key,
  });

  final Test test;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                test.testName,
                style: theme.textTheme.headlineSmall,
              ),
              ConstrainedBox(
                  constraints: const BoxConstraints(minHeight: 40),
                  child: Text(test.testDescription)),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                spacing: 8,
                runSpacing: theme.platform == TargetPlatform.android ? 0 : 8,
                children: test.testCategories
                    .map(
                      (category) => ActionChip(
                        elevation: 10,
                        label: Text(category.title),
                        avatar: Icon(category.icon),
                        side: BorderSide.none,
                        onPressed: () {
                          context.go(
                              '/category?q=${category.title.toLowerCase()}');
                        },
                      ),
                    )
                    .toList(growable: false),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                    child: const Text('Share'),
                    onPressed: () {
                      ShareDialog.share(
                        context,
                        test.testUrl,
                        platforms: SharePlatform.defaults,
                        isUrl: true,
                      );
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    // TODO: migrate to Filled Button
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        theme.colorScheme.primary,
                      ),
                      foregroundColor: MaterialStateProperty.all(
                        theme.colorScheme.onPrimary,
                      ),
                    ),
                    child: const Text('Do test'),

                    onPressed: () {
                      context.go('/test/${test.id}');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
