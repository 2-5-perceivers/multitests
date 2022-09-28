import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:multitests/classes/tests_registry.dart';
import 'package:multitests/pages/category_page.dart';
import 'package:multitests/pages/home_page.dart';
import 'package:multitests/pages/page_404.dart';
import 'package:multitests/pages/test_page.dart';
import 'package:multitests/pages/test_qestions_page.dart';
import 'package:multitests/tests/tests.dart';
import 'package:multitests/utils/constants/eula.dart';
import 'package:multitests/widgets/multitests_about_widgets.dart';

void main() {
  LicenseRegistry.addLicense(
    () => Stream<LicenseEntry>.value(
      const LicenseEntryWithLineBreaks(
        ['MultiTests'],
        appEula,
      ),
    ),
  );
  TestRegistry.addMultiTest(purityTest);

  runApp(MultiTestsApp());
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  ); // Enable Edge-to-Edge on Android 10+
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.transparent, // Setting a transparent navigation bar color
      systemNavigationBarContrastEnforced: true, // Default
      systemStatusBarContrastEnforced: true,
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ],
  );
}

class MultiTestsApp extends StatelessWidget {
  MultiTestsApp({super.key});

  // App's route tree
  final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
              path: 'test/:testID',
              builder: (context, state) {
                return TestPage(state.params['testID'] ?? 'null');
              },
              routes: [
                GoRoute(
                  path: 'run',
                  builder: (context, state) {
                    return TestQuestionsPage(
                        testID: state.params['testID'] ?? 'null');
                  },
                ),
              ]),
          GoRoute(
            path: 'licenses',
            builder: (context, state) => const MultiTestsLicensePage(),
          ),
        ],
      ),
      GoRoute(
        path: '/category',
        builder: (context, state) {
          TestCategory? category;
          try {
            category = state.queryParams['q']?.isEmpty ?? true
                ? null
                : TestCategory.values.firstWhere(
                    (element) =>
                        element.title.toLowerCase() == state.queryParams['q'],
                  );
          } catch (e) {
            return const Page404(
              errorText: 'Wrong input data',
            );
          }
          return CategoryPage(category: category);
        },
      ),
    ],
    errorBuilder: (context, state) => const Page404(),
  );

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ColorScheme? lightColorScheme, darkColorScheme;

        // Building the color scheme from the dynamic color or from the branding
        // colors
        if (lightDynamic != null && darkDynamic != null) {
          // On Android S+ devices, use the provided dynamic color scheme.
          lightColorScheme = lightDynamic.harmonized();
          darkColorScheme = darkDynamic.harmonized();
        } else {
          lightColorScheme = ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          );
          darkColorScheme = ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
            brightness: Brightness.dark,
          );
        }

        return MaterialApp.router(
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          routeInformationProvider: _router.routeInformationProvider,
          debugShowCheckedModeBanner: false,
          title: 'MultiTests',
          themeMode: ThemeMode.system,
          theme: ThemeData(
            colorScheme: lightColorScheme,
            brightness: lightColorScheme.brightness,
            canvasColor: lightColorScheme.background,
            scaffoldBackgroundColor: lightColorScheme.background,
            cardColor: lightColorScheme.surface,
            dividerColor: lightColorScheme.onSurface.withOpacity(0.12),
            dialogBackgroundColor: lightColorScheme.background,
            useMaterial3: true,
            drawerTheme: const DrawerThemeData(elevation: 0),
          ),
          darkTheme: ThemeData(
            colorScheme: darkColorScheme,
            brightness: darkColorScheme.brightness,
            canvasColor: darkColorScheme.background,
            scaffoldBackgroundColor: darkColorScheme.background,
            cardColor: darkColorScheme.surface,
            dividerColor: darkColorScheme.onSurface.withOpacity(0.12),
            dialogBackgroundColor: darkColorScheme.background,
            useMaterial3: true,
            drawerTheme: const DrawerThemeData(elevation: 0),
          ),
        );
      },
    );
  }
}
