import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPost extends StatelessWidget {
  const ShimmerPost({super.key});

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Shimmer.fromColors(
      baseColor: theme.dividerColor.withOpacity(0.6),
      highlightColor: theme.dividerColor.withOpacity(0.3),

      child: Column(
        children: [

          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 12),
            color: theme.cardColor,
          ),

          Container(
            height: 350,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: theme.cardColor,
          ),

        ],
      ),
    );
  }
}
