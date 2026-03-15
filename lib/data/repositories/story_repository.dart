import '../model/story.dart';

class StoryRepository {

  Future<List<Story>> fetchStories() async {

    await Future.delayed(const Duration(milliseconds: 800));

    return [

      Story(
        username: "Dany",
        imageUrl: "https://randomuser.me/api/portraits/men/10.jpg",
        isYourStory: true,
      ),

      Story(
        username: "utkarsh_guptaa",
        imageUrl: "https://randomuser.me/api/portraits/men/45.jpg",
      ),

      Story(
        username: "ana_d_armas",
        imageUrl: "https://randomuser.me/api/portraits/women/65.jpg",
      ),

      Story(
        username: "lewishamil",
        imageUrl: "https://randomuser.me/api/portraits/men/76.jpg",
      ),

      Story(
        username: "john_doe",
        imageUrl: "https://randomuser.me/api/portraits/men/22.jpg",
      ),

    ];
  }
}
