import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 150,
        height: 150,
        child: CircularProgressIndicator(
          strokeWidth: 10,
        ),
      ),
    );
  }
}
