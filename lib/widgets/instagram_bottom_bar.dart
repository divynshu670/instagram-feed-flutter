import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class InstagramBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const InstagramBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(context, FeatherIcons.home, 0),

          _buildIcon(context, FeatherIcons.playCircle, 1),

          _buildIcon(context, FeatherIcons.send, 2),

          _buildIcon(context, FeatherIcons.search, 3),

          GestureDetector(
            onTap: () => onTap(4),
            child: CircleAvatar(
              radius: 14,
              backgroundImage: const NetworkImage(
                "https://randomuser.me/api/portraits/men/32.jpg",
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context, IconData icon, int index) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(icon, size: 26),
    );
  }
}
