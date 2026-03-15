import 'package:flutter/material.dart';
import '../data/model/story.dart';
import '../data/model/post.dart';
import '../data/repositories/post_repository.dart';
import '../data/repositories/story_repository.dart';

class FeedProvider extends ChangeNotifier {

  final PostRepository postRepository = PostRepository();
  final StoryRepository storyRepository = StoryRepository();

  List<Post> posts = [];
  List<Story> stories = [];

  bool isLoading = false;

  int page = 0;

  FeedProvider() {
    loadInitialData();
  }

  Future<void> loadInitialData() async {

    stories = await storyRepository.fetchStories();

    await loadPosts();
  }

  Future<void> loadPosts() async {

    if (isLoading) return;

    isLoading = true;
    notifyListeners();

    final newPosts = await postRepository.fetchPosts(page);

    posts.addAll(newPosts);

    page++;

    isLoading = false;

    notifyListeners();
  }
}
