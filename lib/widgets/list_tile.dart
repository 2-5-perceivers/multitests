import 'package:flutter/material.dart';

class WListTile extends StatelessWidget {
  const WListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.selected = false,
  });

  final Widget? leading, title, subtitle, trailing;
  final GestureTapCallback? onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: ListTile(
        onTap: onTap,
        leading: leading,
        trailing: trailing,
        title: title,
        subtitle: subtitle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        selected: selected,
        selectedColor: Theme.of(context).colorScheme.onSecondaryContainer,
        selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
      ),
    );
  }
}
