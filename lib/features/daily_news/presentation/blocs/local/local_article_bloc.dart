import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_saved_article_usecase.dart';

import '../../../domain/entities/article_entity.dart';
import '../../../domain/usecases/remove_article_usecase.dart';
import '../../../domain/usecases/save_article_usecase.dart';

part 'local_article_event.dart';

part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(this._getSavedArticleUseCase, this._saveArticleUseCase,
      this._removeArticleUseCase)
      : super(const LocalArticleLoading()) {
    on<GetSavedArticles>(getSavedArticles);
    on<RemoveArticle>(removeArticle);
    on<SaveArticle>(saveArticle);
  }

  FutureOr<void> getSavedArticles(
      GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticleDone(articles));
  }

  FutureOr<void> removeArticle(
      RemoveArticle event, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: event.article);
    add(const GetSavedArticles());
  }

  FutureOr<void> saveArticle(
      SaveArticle event, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: event.article);
    add(const GetSavedArticles());
  }
}
