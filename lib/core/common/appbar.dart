import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_pallet.dart';
import 'package:real_estate_app/core/utils/text.dart';

class EstateVerifyAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const EstateVerifyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      elevation: 0,
      title: const Text(
        AppTexts.appName,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.home,
          color: AppPalette.btnColor,
        ),
        onPressed: () {},
      ),
      actions: [
        Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
