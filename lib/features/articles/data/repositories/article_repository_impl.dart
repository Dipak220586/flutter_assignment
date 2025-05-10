import 'package:flutter_assignment/features/articles/data/model/article_model.dart';
import '../../domain/entities/article.dart';
import '../../domain/repository/article_repository.dart';
import '../data_sources/article_remote_data_source.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ArticleRemoteDataSource remoteDataSource;

  ArticleRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Article>> getArticles() async {
    final models = await remoteDataSource.fetchArticles();
    return models.map((m) => m.toEntity()).toList();
  }
}
