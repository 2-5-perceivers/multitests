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
    return Title(
      title: errorText == null ? '404' : '404 - $errorText',
      color: Theme.of(context).colorScheme.primary,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '404',
                style: Theme.of(context).textTheme.displayLarge,
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
