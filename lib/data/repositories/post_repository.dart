import 'dart:async';
import 'package:insta_home_feed/data/model/post.dart';

class PostRepository {

  Future<List<Post>> fetchPosts(int page) async {

    await Future.delayed(const Duration(milliseconds: 1500));

    return List.generate(10, (index) {

      final id = page * 10 + index;

      return Post(
        username: "user_$id",
        profileImage: "https://randomuser.me/api/portraits/men/${index + 20}.jpg",
        verified: index % 3 == 0,
        likes: 500 + index * 15,
        caption: "Beautiful moments captured in this frame 🌿",

        images: List.generate(
          3,
          (i) => "https://picsum.photos/id/${id + i}/600/600",
        ),
      );
    });
  }
}