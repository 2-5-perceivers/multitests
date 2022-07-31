import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitests/classes/test_class.dart';

class CategoriesWrap extends StatelessWidget {
  const CategoriesWrap({
    Key? key,
    required this.testCategories,
    this.pushInsteadOfGo = false,
  }) : super(key: key);

  final List<TestCategory> testCategories;
  final bool pushInsteadOfGo;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: Theme.of(context).platform == TargetPlatform.android ? 0 : 8,
      children: testCategories
          .map(
            (category) => ActionChip(
              elevation: 10,
              label: Text(category.title),
              avatar: Icon(category.icon),
              side: BorderSide.none,
              onPressed: () {
                if (pushInsteadOfGo) {
                  context.push('/category?q=${category.title.toLowerCase()}');
                } else {
                  context.go('/category?q=${category.title.toLowerCase()}');
                }
              },
            ),
          )
          .toList(growable: false),
    );
  }
}
