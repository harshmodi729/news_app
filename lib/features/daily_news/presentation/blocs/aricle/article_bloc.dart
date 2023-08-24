import 'dart:async';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article_usecase.dart';

part 'article_event.dart';

part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  ArticleBloc(this._getArticleUseCase) : super(const ArticleLoading()) {
    on<GetArticles>(_onGetArticle);
  }

  FutureOr<void> _onGetArticle(
      GetArticles event, Emitter<ArticleState> emit) async {
    final DataState dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(ArticleDone(dataState.data));
    } else {
      emit(ArticleError(dataState.dioException!));
    }
  }
}
