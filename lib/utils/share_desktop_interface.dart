import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SharePlatform {
  const SharePlatform(
    this.name, {
    required this.urlSchema,
    required this.icon,
    this.color,
  });
  final IconData icon;
  final MaterialColor? color;
  final String name;

  /// A schema to create the url to be opened for sharing. Use `|body|` and
  /// `|subject|` to insert variables
  final String urlSchema;

  /// Get's the procesed schema. If `isUrl` is true than the function will
  /// encode the body as a url
  String getUrl(String body, String? subject, {bool isUrl = false}) {
    subject ??= '';
    if (isUrl) body = Uri.encodeComponent(body);
    String url = urlSchema;
    url = url.replaceAll('|body|', body).replaceAll('|subject|', subject);
    return url;
  }

  /// Share platform Email - body and subject have the same definition as in an
  /// email
  static SharePlatform get email => const SharePlatform(
        'Email',
        urlSchema: 'mailto:?body=|body|&subject=|subject|',
        icon: Icons.email,
      );

  /// Share platform Telegram - here body is used for a link and subject as the
  /// text below the link.
  static SharePlatform get telegram => const SharePlatform(
        'Telegram',
        urlSchema: 'https://t.me/share?url=|body|&text=|subject|',
        icon: Icons.telegram,
        color: Colors.blue,
      );

  /// Share platform Whatsapp - here subject is ignored
  static SharePlatform get whatsapp => const SharePlatform(
        'Whatsapp',
        urlSchema: 'https://api.whatsapp.com/send/?text=|body|',
        icon: Icons.whatsapp,
        color: Colors.green,
      );

  /// Share platform Reddit
  static SharePlatform get reddit => const SharePlatform(
        'Reddit',
        urlSchema: 'https://www.reddit.com/submit?text=|body|&title=|subject|',
        icon: Icons.reddit,
        color: Colors.red,
      );

  /// A list of all default platforms
  static List<SharePlatform> get defaults => [
        email,
        telegram,
        whatsapp,
        reddit,
      ];
}

class ShareDialog extends StatelessWidget {
  const ShareDialog(
    this.text, {
    required this.sharePlatforms,
    this.subject,
    this.isUrl = false,
    Key? key,
  }) : super(key: key);

  final String text;
  final String? subject;
  final List<SharePlatform> sharePlatforms;
  final bool isUrl;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AlertDialog(
      icon: const Icon(Icons.share),
      title: const Text('Share'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${subject ?? ''} $text',
            style: theme.textTheme.bodySmall,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              width: double.infinity,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: text));
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Copied to clipboard'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                label: const Text('Copy to clipboard'),
                icon: const Icon(Icons.copy),
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 60 * 5),
            child: SingleChildScrollView(
              child: Wrap(
                children: sharePlatforms
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            launchUrl(Uri.parse(
                                    e.getUrl(text, subject, isUrl: isUrl)))
                                .then(
                              (value) => Navigator.of(context).pop(),
                            );
                          },
                          child: CircleAvatar(
                            radius: 32,
                            backgroundColor: e.color?.harmonizeWith(
                                    theme.colorScheme.primary) ??
                                theme.colorScheme.surface,
                            child: Icon(
                              e.icon,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension ShareDesktop on Share {
  /// If `isUrl` is true than the function will encode the body as a url. You
  /// can use [SharePlatform.defaults] instead of providing your own list of
  /// platforms
  static Future<void> shareDesktop(
    BuildContext context,
    String text, {
    String? subject,
    bool isUrl = false,
    Rect? sharePositionOrigin,
    required List<SharePlatform> platforms,
  }) async {
    TargetPlatform platform = Theme.of(context).platform;
    if (platform == TargetPlatform.linux ||
        platform == TargetPlatform.macOS ||
        platform == TargetPlatform.windows ||
        kIsWeb) {
      showDialog(
        context: context,
        builder: (context) => ShareDialog(
          text,
          subject: subject,
          sharePlatforms: platforms,
          isUrl: isUrl,
        ),
      );
    } else {
      Share.share(
        text,
        subject: subject,
        sharePositionOrigin: sharePositionOrigin,
      );
    }
  }
}
