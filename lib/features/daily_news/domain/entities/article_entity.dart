import 'package:floor/floor.dart';

class ArticleEntity {
  List<Article> articles;

  ArticleEntity({
    required this.articles,
  });
}

@Entity(tableName: 'articles', primaryKeys: ['author'])
class Article {
  // Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    // this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

@Entity(tableName: 'sources', primaryKeys: ['id'])
class Source {
  String? id;
  String? name;

  Source({
    this.id,
    this.name,
  });
}
