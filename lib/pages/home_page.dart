import 'package:flutter/material.dart';
import 'package:multitests/classes/tests_registry.dart';
import 'package:multitests/widgets/multitests_drawer.dart';
import 'package:multitests/widgets/test_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Test> testList = TestRegistry.registeredTests;
    return Title(
      title: 'MultiTests',
      color: Theme.of(context).colorScheme.primary,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MultiTests'),
          centerTitle: true,
        ),
        drawer: const MultiTestsDrawer(selectedIndex: 0),
        body: ListView.builder(
          itemBuilder: (context, index) => TestTile(testList[index]),
          itemCount: testList.length,
        ),
      ),
    );
  }
}
