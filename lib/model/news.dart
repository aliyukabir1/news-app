class News {
  final String author;
  final String title;
  final String description;
  final String content;
  final String url;
  final String urlToImage;
  final String publishedAt;

  News(
      {required this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.url,
      required this.urlToImage,
      required this.publishedAt});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        author: json['author'],
        title: json['title'],
        description: json['description'],
        content: json['content'],
        url: json['url'],
        urlToImage: json['urlToImage'],
        publishedAt: json['publishedAt']);
  }
}