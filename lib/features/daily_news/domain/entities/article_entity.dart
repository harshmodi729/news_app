class ArticleEntity {
  List<Article> articles;

  ArticleEntity({
    required this.articles,
  });
}

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

class Source {
  dynamic id;
  String name;

  Source({
    required this.id,
    required this.name,
  });
}
