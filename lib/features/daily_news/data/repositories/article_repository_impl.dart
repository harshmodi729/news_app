import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/data/data_sources/local/dao/app_db.dart';
import 'package:news_app/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article_model.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';

import '../../domain/entities/article_entity.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDb _appDb;

  ArticleRepositoryImpl(this._newsApiService, this._appDb);

  @override
  Future<DataState<ArticleListModel>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apikey,
        category: categoryQuery,
        country: countryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFail(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFail(e);
    }
  }

  @override
  Future<List<Article>> getLocalArticles() {
    return _appDb.articleDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(Article articleModel) {
    return _appDb.articleDao.deleteArticle(articleModel);
  }

  @override
  Future<void> saveArticle(Article articleModel) {
    // if (articleModel.source != null) {
    //   _appDb.sourceDao.insertSource(articleModel.source!);
    // }
    return _appDb.articleDao.insertArticle(articleModel);
  }
}
