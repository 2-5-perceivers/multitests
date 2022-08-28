import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

const String _copyright = '© 2022 2.5 Perceivers and Adorkw',
    _appVersion = '1.2.0';

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
            const SizedBox(
              height: 16,
            ),
            Text(
              'Created by 2.5 Perceivers and Adorkw to simplify the '
              'online tests, give them a nice and a simple interface, with '
              'amazing interpretations, colors and icons.',
              style: theme.textTheme.bodyMedium!.copyWith(
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const MultiTestsMoreDialog(),
                );
              },
              child: const Text(
                'More',
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push('/licenses');
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
        ),
      ],
    );
  }
}

class MultiTestsMoreDialog extends StatelessWidget {
  const MultiTestsMoreDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Tap to learn more'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                title: Text(
                  'Adorkw',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: const Text(
                  'A Romanian technology company that focuses on simplifying '
                  "and securing users' lives.",
                ),
                trailing: const Icon(Icons.north_east),
                onTap: () {
                  launchUrl(
                    Uri.https('adorkw.home.ro'),
                    mode: LaunchMode.externalNonBrowserApplication,
                    webOnlyWindowName: '_blank',
                  );
                },
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: ListTile(
                title: Text(
                  '2.5 Perceivers',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: const Text(
                  'An open-source organization created by two and a half '
                  "people to share their ideas with the public. Adorkw's "
                  'biggest open-source partner.',
                ),
                trailing: const Icon(Icons.north_east),
                onTap: () {
                  launchUrl(
                    Uri.https('github.com', '/2-5-perceivers'),
                    mode: LaunchMode.externalNonBrowserApplication,
                    webOnlyWindowName: '_blank',
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
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
