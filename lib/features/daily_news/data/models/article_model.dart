import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

class ArticleListModel extends ArticleEntity {
  ArticleListModel({required super.articles});

  static ArticleListModel fromJson(Map<String, dynamic> json) =>
      ArticleListModel(
        articles: List<ArticleModel>.from(
            json["articles"].map((x) => ArticleModel.fromJson(x))),
      );
}

class ArticleModel extends Article {
  ArticleModel(
      {required super.source,
      required super.author,
      required super.title,
      required super.description,
      required super.url,
      required super.urlToImage,
      required super.publishedAt,
      required super.content});

  static ArticleModel fromJson(Map<String, dynamic> json) => ArticleModel(
        source: SourceModel.fromJson(json["source"]),
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );
}

class SourceModel extends Source {
  SourceModel({required super.id, required super.name});

  static SourceModel fromJson(Map<String, dynamic> json) => SourceModel(
        id: json["id"],
        name: json["name"],
      );
}
