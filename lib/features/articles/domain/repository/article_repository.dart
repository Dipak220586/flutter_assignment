import '../entities/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticles();
}