import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';

abstract class ArticleRepository {
  // Remote
  Future<DataState<ArticleEntity>> getNewsArticles();

  // Local
  Future<List<ArticleModel>> getLocalArticles();

  Future<void> saveArticle(ArticleModel articleModel);

  Future<void> removeArticle(ArticleModel articleModel);
}