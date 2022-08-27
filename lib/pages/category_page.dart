import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitests/classes/tests_registry.dart';
import 'package:multitests/pages/page_404.dart';
import 'package:multitests/widgets/multitests_drawer.dart';
import 'package:multitests/widgets/test_tile.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({
    required this.category,
    super.key,
  });

  final TestCategory? category;

  @override
  Widget build(BuildContext context) {
    if (category == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Category')),
        drawer: const WDrawer(
          selected: 1,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Card(
            clipBehavior: Clip.antiAlias,
            child: ListTile(
              title: Text(TestCategory.values[index].title),
              leading: Icon(TestCategory.values[index].icon),
              onTap: () {
                GoRouter.of(context).push(
                  '/category?q=${TestCategory.values[index].title.toLowerCase()}',
                );
              },
            ),
          ),
          itemCount: TestCategory.values.length,
        ),
      );
    }
    return Title(
      title: 'MultiTests - ${category!.title}',
      color: Theme.of(context).colorScheme.primary,
      child: Scaffold(
        body: FutureBuilder<List<Test>>(
          builder: (context, snapshot) {
            return CustomScrollView(
              slivers: <Widget>[
                if (snapshot.hasData)
                  SliverAppBar(
                    pinned: true,
                    title: Text('Category - ${category!.title}'),
                  ),
                if (snapshot.hasData)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return TestTile(snapshot.data![index]);
                      },
                      childCount: snapshot.data!.length,
                    ),
                  ),
                if (snapshot.hasError)
                  const SliverFillRemaining(
                    child: Page404(errorText: 'No test found'),
                  ),
                if (snapshot.connectionState == ConnectionState.waiting)
                  const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()),
                  ),
              ],
            );
          },
          future: loadCategoryTests(),
        ),
      ),
    );
  }

  Future<List<Test>> loadCategoryTests() async {
    List<Test> registered = TestRegistry.registeredTests, result = [];
    for (var test in registered) {
      if (test.testCategories.contains(category!)) {
        result.add(test);
      }
    }
    if (result.isEmpty) {
      throw '';
    }
    return result;
  }
}
