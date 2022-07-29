import 'package:flutter/material.dart';
import 'package:multitests/classes/tests_registry.dart';
import 'package:multitests/pages/page_404.dart';
import 'package:multitests/widgets/actions_builder_widget.dart';

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
    } on StateError {
      return const Page404(
        errorText: 'It seems this test does not exist.',
      );
    }
    return Title(
      title: 'MultiTests - ${test.testName}',
      color: Theme.of(context).colorScheme.primary,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: Text(test.testName),
              actions: ActionsLayout.list(
                [
                  ActionItem(
                    actionTitle: 'Share test',
                    icon: Icons.share_rounded,
                    onTap: (context, inMenu) {
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
