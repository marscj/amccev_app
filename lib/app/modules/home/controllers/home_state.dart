import 'package:app/package/wp/src/models/post.dart';

class HomeState {
  final List<Post> posts;

  HomeState({this.posts = const []});

  HomeState copyWith(List<Post>? posts) {
    return HomeState(posts: posts ?? []);
  }
}
