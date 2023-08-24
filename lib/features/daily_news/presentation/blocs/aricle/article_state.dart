part of 'article_bloc.dart';

@immutable
abstract class ArticleState extends Equatable {
  final ArticleEntity? articleEntity;
  final DioException? dioException;

  const ArticleState({this.articleEntity, this.dioException});

  @override
  List<Object> get props => [articleEntity!, dioException!];
}

class ArticleLoading extends ArticleState {
  const ArticleLoading();
}

class ArticleDone extends ArticleState {
  const ArticleDone(ArticleEntity articleEntity)
      : super(articleEntity: articleEntity);
}

class ArticleError extends ArticleState {
  const ArticleError(DioException dioException)
      : super(dioException: dioException);
}
