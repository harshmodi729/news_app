import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';

@dao
abstract class ArticleDao {

  @Insert()
  Future<void> insertArticle(ArticleListModel articleListModel);

  @Delet
}
