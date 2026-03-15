import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstagramAppBar extends StatefulWidget implements PreferredSizeWidget {
  const InstagramAppBar({super.key});

  @override
  State<InstagramAppBar> createState() => _InstagramAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(48);
}

class _InstagramAppBarState extends State<InstagramAppBar> {
  bool showDropdown = false;

  void toggleDropdown() {
    setState(() {
      showDropdown = !showDropdown;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Dropdown not implemented"),
        duration: Duration(milliseconds: 200),
      ),
    );
  }

  void showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 48,
      elevation: 0,
      centerTitle: true,

      /// LEFT BUTTON
      leading: IconButton(
        icon: const Icon(FeatherIcons.plus),
        onPressed: () {
          showSnack("Plus button not implemented");
        },
      ),

      /// INSTAGRAM LOGO
      title: GestureDetector(
        onTap: toggleDropdown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.network(
              "https://upload.wikimedia.org/wikipedia/commons/2/2a/Instagram_logo.svg",
              height: 48,
            ),
            const SizedBox(width: 4),
            Icon(
              showDropdown
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              size: 20,
            ),
          ],
        ),
      ),

      /// RIGHT ICONS
      actions: [
        IconButton(
          icon: const Icon(FeatherIcons.heart),
          onPressed: () {
            showSnack("Heart button not implemented");
          },
        ),
      ],
    );
  }
}
