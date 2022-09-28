import 'package:flutter/widgets.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 816,
        ),
        child: child,
      ),
    );
  }
}
