import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/core/usecases/usecases.dart';
import 'package:news_app/features/daily_news/domain/entities/article_entity.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';

class GetArticleUseCase implements UseCases<DataState<ArticleEntity>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<ArticleEntity>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
