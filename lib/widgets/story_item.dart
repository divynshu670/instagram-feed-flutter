import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  final String username;
  final String imageUrl;
  final bool isYourStory;

  const StoryItem({
    super.key,
    required this.username,
    required this.imageUrl,
    this.isYourStory = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyMedium!.color;
    final bgColor = Theme.of(context).scaffoldBackgroundColor;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final addBgColor = isDark ? Colors.white : Colors.blue;
    final addIconColor = isDark ? Colors.black : Colors.white;


    return SizedBox(
      width: 85,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Avatar container (same height for all)
          SizedBox(
            height: 74,
            width: 74,
            child: isYourStory
                ? Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 31,
                          backgroundImage: NetworkImage(imageUrl),
                        ),
                      ),

                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: bgColor,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:  addBgColor,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 12,
                              color: addIconColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFFFEDA75),
                          Color(0xFFFA7E1E),
                          Color(0xFFD62976),
                          Color(0xFF962FBF),
                          Color(0xFF4F5BD5),
                        ],
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: bgColor,
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(imageUrl),
                      ),
                    ),
                  ),
          ),

          const SizedBox(height: 6),

          /// Username
          SizedBox(
            width: 80,
            child: Text(
              username,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
