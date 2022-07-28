import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitests/widgets/multitests_about_widgets.dart';

class MultiTestsDrawer extends StatelessWidget {
  const MultiTestsDrawer({this.selectedIndex, super.key});

  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                'MultiTests',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
          ListTile(
            title: const Text('Tests'),
            selected: selectedIndex == 0,
            onTap: () {
              if (selectedIndex != 0) {
                // Pop the drawer and then move to 'Tests' page
                Navigator.of(context).pop();
                context.go('/');
              }
            },
          ),
          ListTile(
            title: const Text('Category'),
            selected: selectedIndex == 1,
            onTap: () {
              if (selectedIndex != 1) {
                // Pop the drawer and then move to 'Category' page
                Navigator.of(context).pop();
                context.go('/category');
              }
            },
          ),
          const Expanded(
            // Space to force showing the about tile at the bottom
            child: SizedBox(),
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.info_outline_rounded),
            subtitle: const Text('More info about the app'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const MultiTestsAboutDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
