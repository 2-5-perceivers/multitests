import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String _copyright = '© 2022 2.5 Perceivers and Adorkw',
    _appVersion = '1.1.2';

/// A dialog that show information about MultiTests and opens up a License Page
class MultiTestsAboutDialog extends StatelessWidget {
  const MultiTestsAboutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      title: const Text('About MultiTests'),
      icon: const Icon(Icons.info_outline_rounded),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              _copyright,
              style: theme.textTheme.titleMedium,
            ),
            Text(
              'Version $_appVersion',
              style: theme.textTheme.titleMedium,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Created by 2.5 Perceivers and Adorkw to simplify the '
              'online tests, give them a nice and a simple interface, with '
              'amazing interpretations and icons. Blowing your mind with '
              'colors and an app variant.',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            GoRouter.of(context).go('/licenses');
          },
          child: const Text(
            'Licenses',
            textAlign: TextAlign.end,
          ),
        ),
        TextButton(
          // Close the dialog
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Close',
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

/// A wraped licensed page with all the info
class MultiTestsLicensePage extends StatelessWidget {
  const MultiTestsLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LicensePage(
      applicationName: 'MultiTests',
      applicationVersion: _appVersion,
      applicationLegalese: _copyright,
    );
  }
}
