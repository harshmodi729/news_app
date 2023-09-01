part of 'local_article_bloc.dart';

@immutable
abstract class LocalArticleEvent extends Equatable {
  final Article? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];
}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class RemoveArticle extends LocalArticleEvent {
  const RemoveArticle(Article article) : super(article: article);
}

class SaveArticle extends LocalArticleEvent {
  const SaveArticle(Article article) : super(article: article);
}
