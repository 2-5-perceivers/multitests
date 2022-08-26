import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:multitests/classes/test_provider.dart';
import 'package:multitests/pages/page_404.dart';
import 'package:multitests/pages/results_page.dart';
import 'package:multitests/widgets/loading_widget.dart';
import 'package:multitests/widgets/questions_widgets/category_card.dart';
import 'package:provider/provider.dart';

class TestQuestionsPage extends StatelessWidget {
  const TestQuestionsPage({
    required this.testID,
    super.key,
  });

  final String testID;

  @override
  Widget build(BuildContext context) {
    return Provider<TestProvider>(
      create: (BuildContext context) => TestProvider(testID),
      dispose: (context, value) => value.dispose(),
      builder: (context, child) => FutureBuilder<Test>(
        future: TestProvider.of(context).loadTest(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Test test = snapshot.data!;
            return Title(
              color: Theme.of(context).colorScheme.primary,
              title: 'MultiTests - ${test.testName}',
              child: Scaffold(
                appBar: AppBar(
                  title: Text(test.testName),
                ),
                body: const _QuesionPageAxis(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Page404(
              errorText: 'It seems this test does not exist.',
            );
          } else {
            return const Scaffold(
              body: LoadingWidget(),
            );
          }
        },
      ),
    );
  }
}

class _QuesionPageAxis extends StatefulWidget {
  const _QuesionPageAxis();

  @override
  State<_QuesionPageAxis> createState() => _QuesionPageAxisState();
}

class _QuesionPageAxisState extends State<_QuesionPageAxis> {
  int pageIndex = 0;
  bool reversingPage = false;

  late TestProvider _testProvider;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    _testProvider = TestProvider.of(context);
    List<TestQuestionsCategory> actualViews = _testProvider.paged
        ? [_testProvider.categories[pageIndex]]
        : _testProvider.categories;
    return Column(
      children: [
        Expanded(
          child: PageTransitionSwitcher(
            reverse: reversingPage,
            transitionBuilder: (
              Widget child,
              Animation<double> primaryAnimation,
              Animation<double> secondaryAnimation,
            ) {
              return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: ListView(
              key: ValueKey<int>(pageIndex),
              children: [
                for (var category in actualViews) WQCategoryCard(category),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 70,
          child: Container(
            color: ElevationOverlay.applySurfaceTint(
              theme.colorScheme.surface,
              theme.colorScheme.surfaceTint,
              2,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_testProvider.paged)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: pageIndex == 0
                            ? null
                            : () {
                                setState(() {
                                  reversingPage = true;
                                  pageIndex--;
                                });
                              },
                        child: const Text('Back'),
                      ),
                    ),
                  if (_testProvider.paged)
                    const SizedBox(
                      width: 8,
                    ),
                  Expanded(
                    child: pageIndex >= _testProvider.categories.length - 1 ||
                            !_testProvider.paged
                        ? FilledButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    _testProvider.finnish(),
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.done_rounded),
                            label: const Text('Finish'),
                          )
                        : FilledButton(
                            onPressed: () {
                              setState(() {
                                reversingPage = false;
                                pageIndex++;
                              });
                            },
                            child: const Text('Next'),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
