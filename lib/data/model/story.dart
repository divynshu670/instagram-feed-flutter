class Story {
  final String username;
  final String imageUrl;
  final bool isYourStory;

  Story({
    required this.username,
    required this.imageUrl,
    this.isYourStory = false,
  });
}
