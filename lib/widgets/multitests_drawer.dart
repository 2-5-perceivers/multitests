import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitests/classes/multi_icons_icons.dart';
import 'package:multitests/widgets/multitests_about_widgets.dart';

import 'package:multitests/widgets/list_tile.dart';

List<_Page> _pages = [
  _Page(MultiIcons.home, 'Home', '/'),
  _Page(MultiIcons.category, 'Categories', '/category'),
];

class WDrawer extends StatelessWidget {
  const WDrawer({
    super.key,
    this.selected = -1,
  });

  final int selected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    'MultiTests',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ),
            ),
          ),
          for (int i = 0; i < _pages.length; i++)
            WListTile(
              leading: Icon(_pages[i].icon),
              title: Text(_pages[i].title),
              selected: i == selected,
              onTap: () {
                context.go(_pages[i].pagePath);
              },
            ),
          const Expanded(
            // Space to force showing the about tile at the bottom
            child: SizedBox(),
          ),
          const Divider(indent: 32, endIndent: 32),
          WListTile(
            title: const Text('About'),
            leading: Icon(MultiIcons.info),
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

class _Page {
  const _Page(this.icon, this.title, this.pagePath);
  final IconData icon;
  final String title, pagePath;
}
