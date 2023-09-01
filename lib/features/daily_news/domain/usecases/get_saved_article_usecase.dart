import 'package:news_app/core/usecases/usecases.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';

import '../entities/article_entity.dart';

class GetSavedArticleUseCase extends UseCases<List<Article>, void> {
  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<Article>> call({void params}) {
    return _articleRepository.getLocalArticles();
  }
}
