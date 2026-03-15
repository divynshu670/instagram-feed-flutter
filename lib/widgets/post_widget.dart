import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:insta_home_feed/data/model/post.dart';
import 'pinch_zoom_overlay.dart';

class PostWidget extends StatefulWidget {

  final Post post;

  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {

  int currentPage = 0;

  bool liked = false;
  bool saved = false;

  void showSnackbar() {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Feature not implemented"),
        duration: Duration(milliseconds: 200),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        /// PROFILE ROW
        ListTile(

          contentPadding: const EdgeInsets.symmetric(horizontal: 12),

          leading: CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(widget.post.profileImage),
          ),

          title: Row(
            children: [

              Text(widget.post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold)),

              if (widget.post.verified)
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(Icons.verified,
                      size: 16,
                      color: Colors.blue),
                ),
            ],
          ),

          trailing: const Icon(Icons.more_vert),
        ),

        /// IMAGE CAROUSEL
        Stack(

          alignment: Alignment.bottomCenter,

          children: [

            SizedBox(

              height: 350,

              child: PageView.builder(

                itemCount: widget.post.images.length,

                onPageChanged: (index) {
                  setState(() => currentPage = index);
                },

                itemBuilder: (_, index) {

                  return GestureDetector(

                    onDoubleTap: () {
                      setState(() => liked = true);
                    },

                    child: PinchZoomOverlay(

                      child: CachedNetworkImage(

                        imageUrl: widget.post.images[index],

                        fit: BoxFit.cover,

                        width: double.infinity,

                        placeholder: (_, __) => const Center(
                          child: CircularProgressIndicator(strokeWidth: 1),
                        ),

                        errorWidget: (_, __, ___) => Container(
                          color: Colors.black12,
                          child: const Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            /// DOT INDICATOR
            if (widget.post.images.length > 1)

              Positioned(

                bottom: 10,

                child: Row(

                  children: List.generate(

                    widget.post.images.length,

                    (index) => Container(

                      margin: const EdgeInsets.symmetric(horizontal: 3),

                      width: 6,
                      height: 6,

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentPage == index
                            ? Colors.blue
                            : Colors.white54,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),

        /// ACTION ROW
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

          child: Row(

            children: [

              GestureDetector(
                onTap: () => setState(() => liked = !liked),

                child: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.red : null,
                  size: 26,
                ),
              ),

              const SizedBox(width: 16),

              GestureDetector(
                onTap: showSnackbar,
                child: const Icon(Icons.mode_comment_outlined, size: 26),
              ),

              const SizedBox(width: 16),

              GestureDetector(
                onTap: showSnackbar,
                child: const Icon(Icons.send_outlined, size: 26),
              ),

              const Spacer(),

              GestureDetector(
                onTap: () => setState(() => saved = !saved),

                child: Icon(
                  saved ? Icons.bookmark : Icons.bookmark_border,
                  size: 26,
                ),
              ),
            ],
          ),
        ),

        /// LIKES
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),

          child: Text(
            "${widget.post.likes} likes",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        const SizedBox(height: 4),

        /// CAPTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),

          child: RichText(

            text: TextSpan(

              style: Theme.of(context).textTheme.bodyMedium,

              children: [

                TextSpan(
                  text: "${widget.post.username} ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                TextSpan(text: widget.post.caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

      ],
    );
  }
}