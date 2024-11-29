// lib/models/blog_post.dart

class BlogPost {
  final String id;
  final String imageURL;
  final String title;
  final String summary;
  final String content;

  BlogPost({
    required this.id,
    required this.imageURL,
    required this.title,
    required this.summary,
    required this.content,
  });

  factory BlogPost.fromMap(Map<String, dynamic> map, String id) {
    return BlogPost(
      id: id,
      imageURL: map['imageURL'] ?? '',
      title: map['title'] ?? '',
      summary: map['summary'] ?? '',
      content: map['content'] ?? '',
    );
  }

}
