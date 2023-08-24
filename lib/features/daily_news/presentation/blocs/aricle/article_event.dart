part of 'article_bloc.dart';

@immutable
abstract class ArticleEvent {
  const ArticleEvent();
}

class GetArticles extends ArticleEvent {
  const GetArticles();
}
