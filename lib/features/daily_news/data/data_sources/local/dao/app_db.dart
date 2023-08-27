import 'dart:async';

import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/data/data_sources/local/source_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../../domain/entities/article_entity.dart';
import '../../../models/article_model.dart';
import '../article_dao.dart';

part 'app_db.g.dart';

@Database(version: 1, entities: [ArticleModel, SourceModel])
abstract class AppDb extends FloorDatabase {
  ArticleDao get articleDao;
  SourceDao get sourceDao;
}
