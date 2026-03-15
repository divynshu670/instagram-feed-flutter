class Post {
  final String username;
  final String profileImage;
  final List<String> images;
  final String caption;
  final int likes;
  final bool verified;

  Post({
    required this.username,
    required this.profileImage,
    required this.images,
    required this.caption,
    required this.likes,
    this.verified = false,
  });
}
