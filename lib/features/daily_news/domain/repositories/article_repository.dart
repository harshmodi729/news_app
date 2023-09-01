import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  // Remote
  Future<DataState<ArticleEntity>> getNewsArticles();

  // Local
  Future<List<Article>> getLocalArticles();

  Future<void> saveArticle(Article articleModel);

  Future<void> removeArticle(Article articleModel);
}