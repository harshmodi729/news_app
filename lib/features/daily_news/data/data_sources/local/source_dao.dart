import 'package:floor/floor.dart';

import '../../../domain/entities/article_entity.dart';

@dao
abstract class SourceDao {
  @insert
  Future<void> insertSource(Source source);

  @delete
  Future<void> deleteSource(Source source);

  @Query('SELECT * from sources')
  Future<List<Source>> getAllSources();
}
