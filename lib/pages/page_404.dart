import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page404 extends StatelessWidget {
  const Page404({
    this.errorText,
    super.key,
  });

  final String? errorText;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Title(
      title: errorText == null ? '404' : '404 - $errorText',
      color: theme.colorScheme.primary,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '404',
                style: theme.textTheme.displayLarge,
              ),
              if (errorText != null) Text(errorText!),
              const SizedBox(
                height: 30,
              ),
              FloatingActionButton.extended(
                onPressed: () => context.go('/'),
                label: const Text('Go back home'),
                icon: const Icon(Icons.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
