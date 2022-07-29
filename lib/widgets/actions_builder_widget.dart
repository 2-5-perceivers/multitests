import 'package:flutter/material.dart';

class ActionsLayout extends StatelessWidget {
  const ActionsLayout(
      {required this.items,
      this.maximumIcons = _defaultMaximumIcons,
      super.key});

  static const int _defaultMaximumIcons = 3;
  final int maximumIcons;

  final List<ActionItem> items;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // double maxIcons = constraints.maxWidth / 56;
        // int actualIcons =
        //     maxIcons > maximumIcons ? maximumIcons : maxIcons.toInt();
        // if (actualIcons < 1) actualIcons = 1;

        List<ActionItem> outsideOfMenu = [], menu = [];
        int countOfOutside = 0;
        for (var item in items) {
          if (item.icon != null && countOfOutside < maximumIcons - 1) {
            outsideOfMenu.add(item);
            countOfOutside++;
          } else {
            menu.add(item);
          }
        }

        if (menu.length == 1 && menu.first.icon != null) {
          ActionItem item = menu.first;
          menu = [];
          outsideOfMenu.add(item);
        }

        return Row(
          children: [
            for (ActionItem item in outsideOfMenu)
              IconButton(
                tooltip: item.actionTitle,
                onPressed: item.onTap == null
                    ? null
                    : () => item.onTap!(context, false),
                icon: Icon(item.icon),
              ),
            if (menu.isNotEmpty)
              PopupMenuButton<int>(
                onSelected: (value) => menu[value].onTap!(context, true),
                itemBuilder: (context) => [
                  for (int i = 0; i < menu.length; i++)
                    PopupMenuItem(
                      value: i,
                      child: Text(menu[i].actionTitle),
                      enabled: menu[i].onTap != null,
                    ),
                ],
              ),
          ],
        );
      },
    );
  }

  static List<Widget> list(List<ActionItem> items,
      {int maximumIcons = _defaultMaximumIcons}) {
    return [
      SizedBox(
        child: ActionsLayout(
          items: items,
          maximumIcons: maximumIcons,
        ),
      ),
    ];
  }
}

class ActionItem {
  const ActionItem({required this.actionTitle, this.icon, this.onTap});

  /// The icon of the action. If null, the action will only be shown in the
  /// popup menu
  final IconData? icon;

  /// The tile of the action that will be displayed if the action get's in the
  /// popup menu or as the tooltip otherwise
  final String actionTitle;

  /// The callback of the action. `inMenu` is true if the action is tapped while
  /// in the popup menu if null the action will be disabled.
  final ActionCallback? onTap;
}

typedef ActionCallback = void Function(BuildContext context, bool inMenu);
