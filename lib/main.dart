import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:multitests/classes/tests_registry.dart';
import 'package:multitests/pages/category_page.dart';
import 'package:multitests/pages/home_page.dart';
import 'package:multitests/pages/page_404.dart';
import 'package:multitests/pages/test_page.dart';
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
  TestRegistry.addMultiTest(
    const Test(
      id: 'purity_test',
      version: '0.1.0',
      testName: 'Purity Test',
      testDescription: 'A simple bucket list',
      testDuration: Duration(minutes: 20),
      testQuestions: [],
      testCategories: [
        TestCategory.explicit,
        TestCategory.maturity,
        TestCategory.personality,
        TestCategory.scientific,
        TestCategory.nonScientific,
      ],
      testDataCollections: [
        TestDataCollection.personality,
        TestDataCollection.ethnicity,
      ],
      testSuggestions: [
        'Think with your brain, not your willy',
        "Don't be a fucking cunt",
      ],
    ),
  );
  TestRegistry.addMultiTest(
    const Test(
      id: 'camels',
      version: '0.1.0',
      testName: 'How Many Camels',
      testDescription: 'Find out how many camels you are worth',
      testDuration: Duration(minutes: 5),
      testQuestions: [],
      testCategories: [TestCategory.nonScientific],
    ),
  );
  runApp(MultiTestsApp());
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
            path: 'category',
            builder: (context, state) {
              TestCategory? category;
              try {
                category = state.queryParams['q']?.isEmpty ?? true
                    ? null
                    : TestCategory.values.firstWhere(
                        (element) =>
                            element.title.toLowerCase() ==
                            state.queryParams['q'],
                      );
              } catch (e) {
                return const Page404(
                  errorText: 'Wrong input data',
                );
              }
              return CategoryPage(category: category);
            },
          ),
          GoRoute(
            path: 'licenses',
            builder: (context, state) => const MultiTestsLicensePage(),
          ),
        ],
      )
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
          theme: ThemeData.from(
            colorScheme: lightColorScheme,
            useMaterial3: true,
          ),
          darkTheme: ThemeData.from(
            colorScheme: darkColorScheme,
            useMaterial3: true,
          ),
        );
      },
    );
  }
}
