import 'package:flutter/material.dart';
import 'package:insta_home_feed/widgets/post_widget.dart';
import 'package:provider/provider.dart';
import 'package:insta_home_feed/widgets/app_bar_widget.dart';

import '../../providers/feed_provider.dart';
import '../../widgets/shimmer_post.dart';
import '../../widgets/stories_tray.dart';
import '../../widgets/instagram_bottom_bar.dart';


class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {

  final ScrollController controller = ScrollController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {

      if (controller.position.pixels >
          controller.position.maxScrollExtent - 400) {

        context.read<FeedProvider>().loadPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<FeedProvider>();

    return Scaffold(


      body: SafeArea(
        child: ListView(
        
          controller: controller,
        
          children: [
            
            /// APP BAR
            InstagramAppBar(),
        
        
            /// STORIES
            StoriesTray(stories: provider.stories),
        
        
            /// POSTS
            ...provider.posts.map(
              (post) => PostWidget(post: post),
            ),
        
            /// SHIMMER LOADING
            if (provider.isLoading)
              ...List.generate(
                3,
                (index) => const ShimmerPost(),
              ),
          ],
        ),
      ),

      bottomNavigationBar: InstagramBottomBar(

        currentIndex: currentIndex,

        onTap: (index) {

          setState(() {
            currentIndex = index;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Navigation not implemented"),
              duration: Duration(milliseconds: 200),
            ),
          );
        },
      ),
    );
  }
}
