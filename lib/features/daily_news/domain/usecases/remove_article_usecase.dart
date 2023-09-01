import 'package:news_app/core/usecases/usecases.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repository.dart';

import '../entities/article_entity.dart';

class RemoveArticleUseCase extends UseCases<void, Article> {
  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({Article? params}) {
    return _articleRepository.removeArticle(params!);
  }
}
