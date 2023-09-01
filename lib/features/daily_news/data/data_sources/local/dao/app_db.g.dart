// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDb {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder databaseBuilder(String name) => _$AppDbBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDbBuilder inMemoryDatabaseBuilder() => _$AppDbBuilder(null);
}

class _$AppDbBuilder {
  _$AppDbBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDbBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDbBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDb> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDb();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDb extends AppDb {
  _$AppDb([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ArticleDao? _articleDaoInstance;

  SourceDao? _sourceDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `articles` (`author` TEXT, `title` TEXT, `description` TEXT, `url` TEXT, `urlToImage` TEXT, `publishedAt` TEXT, `content` TEXT, PRIMARY KEY (`author`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `sources` (`id` TEXT, `name` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ArticleDao get articleDao {
    return _articleDaoInstance ??= _$ArticleDao(database, changeListener);
  }

  @override
  SourceDao get sourceDao {
    return _sourceDaoInstance ??= _$SourceDao(database, changeListener);
  }
}

class _$ArticleDao extends ArticleDao {
  _$ArticleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _articleInsertionAdapter = InsertionAdapter(
            database,
            'articles',
            (Article item) => <String, Object?>{
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                }),
        _articleUpdateAdapter = UpdateAdapter(
            database,
            'articles',
            ['author'],
            (Article item) => <String, Object?>{
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                }),
        _articleDeletionAdapter = DeletionAdapter(
            database,
            'articles',
            ['author'],
            (Article item) => <String, Object?>{
                  'author': item.author,
                  'title': item.title,
                  'description': item.description,
                  'url': item.url,
                  'urlToImage': item.urlToImage,
                  'publishedAt': item.publishedAt,
                  'content': item.content
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Article> _articleInsertionAdapter;

  final UpdateAdapter<Article> _articleUpdateAdapter;

  final DeletionAdapter<Article> _articleDeletionAdapter;

  @override
  Future<List<Article>> getAllArticles() async {
    return _queryAdapter.queryList('SELECT * from articles',
        mapper: (Map<String, Object?> row) => Article(
            author: row['author'] as String?,
            title: row['title'] as String?,
            description: row['description'] as String?,
            url: row['url'] as String?,
            urlToImage: row['urlToImage'] as String?,
            publishedAt: row['publishedAt'] as String?,
            content: row['content'] as String?));
  }

  @override
  Future<void> insertArticle(Article articleModel) async {
    await _articleInsertionAdapter.insert(
        articleModel, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateArticle(Article articleModel) async {
    await _articleUpdateAdapter.update(
        articleModel, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteArticle(Article articleModel) async {
    await _articleDeletionAdapter.delete(articleModel);
  }
}

class _$SourceDao extends SourceDao {
  _$SourceDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _sourceInsertionAdapter = InsertionAdapter(
            database,
            'sources',
            (Source item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _sourceDeletionAdapter = DeletionAdapter(
            database,
            'sources',
            ['id'],
            (Source item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Source> _sourceInsertionAdapter;

  final DeletionAdapter<Source> _sourceDeletionAdapter;

  @override
  Future<List<Source>> getAllSources() async {
    return _queryAdapter.queryList('SELECT * from sources',
        mapper: (Map<String, Object?> row) =>
            Source(id: row['id'] as String?, name: row['name'] as String?));
  }

  @override
  Future<void> insertSource(Source source) async {
    await _sourceInsertionAdapter.insert(source, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSource(Source source) async {
    await _sourceDeletionAdapter.delete(source);
  }
}
