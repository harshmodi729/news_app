part of 'local_article_bloc.dart';

@immutable
abstract class LocalArticleState extends Equatable {
  final List<Article>? articles;

  const LocalArticleState({this.articles});

  @override
  List<Object> get props => [articles ?? []];
}

class LocalArticleLoading extends LocalArticleState {
  const LocalArticleLoading();
}

class LocalArticleDone extends LocalArticleState {
  const LocalArticleDone(List<Article> articles) : super(articles: articles);
}
