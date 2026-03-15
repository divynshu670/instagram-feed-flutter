import 'package:flutter/material.dart';
import 'package:insta_home_feed/data/model/story.dart';
import 'story_item.dart';

class StoriesTray extends StatelessWidget {
  final List<Story> stories;

  const StoriesTray({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),

          itemBuilder: (context, index) {
            /// First item → Your Story (NOT from list)
            if (index == 0) {
              return const StoryItem(
                username: "Your story",
                imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
                isYourStory: true,
              );
            }

            final story = stories[index - 1];

            return StoryItem(
              username: story.username,
              imageUrl: story.imageUrl,
            );
          },

          separatorBuilder: (_, __) => const SizedBox(width: 12),

          itemCount: stories.length + 1,
        ),
      ),
    );
  }
}
