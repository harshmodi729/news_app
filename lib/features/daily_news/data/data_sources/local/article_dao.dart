import 'package:floor/floor.dart';

import '../../../domain/entities/article_entity.dart';

@dao
abstract class ArticleDao {
  @insert
  Future<void> insertArticle(Article articleModel);

  @delete
  Future<void> deleteArticle(Article articleModel);

  @Query('SELECT * from articles')
  Future<List<Article>> getAllArticles();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateArticle(Article articleModel);
}
