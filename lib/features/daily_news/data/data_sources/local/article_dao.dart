import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';

@dao
abstract class ArticleDao {
  @insert
  Future<void> insertArticle(ArticleModel articleModel);

  @delete
  Future<void> deleteArticle(ArticleModel articleModel);

  @Query('SELECT * from articles')
  Future<List<ArticleModel>> getAllArticles();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateArticle(ArticleModel articleModel);
}
