import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';

@dao
abstract class SourceDao {
  @insert
  Future<void> insertSource(SourceModel sourceModel);

  @delete
  Future<void> deleteSource(SourceModel sourceModel);

  @Query('SELECT * from sources')
  Future<List<SourceModel>> getAllSources();
}
