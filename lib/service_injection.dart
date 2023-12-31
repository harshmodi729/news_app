import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repositories/article_repository_impl.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:news_app/features/daily_news/domain/usecases/save_article_usecase.dart';
import 'package:news_app/features/daily_news/presentation/blocs/aricle/article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/blocs/local/local_article_bloc.dart';

import 'features/daily_news/data/data_sources/local/dao/app_db.dart';
import 'features/daily_news/domain/usecases/get_saved_article_usecase.dart';

final si = GetIt.instance;

Future<void> initServiceInjection() async {
  // create db
  final database = await $FloorAppDb.databaseBuilder('app_db.db').build();
  si.registerSingleton<AppDb>(database);

  // dio
  si.registerSingleton<Dio>(Dio());

  // services
  si.registerSingleton<NewsApiService>(NewsApiService(si()));

  // repository
  si.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(si(), si()));

  // usecase
  si.registerSingleton<GetArticleUseCase>(GetArticleUseCase(si()));
  si.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(si()));
  si.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(si()));
  si.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(si()));

  // bloc
  si.registerFactory<ArticleBloc>(() => ArticleBloc(si()));
  si.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(si(), si(), si()));
}
