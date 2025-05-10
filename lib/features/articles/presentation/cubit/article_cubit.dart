import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/article.dart';
import '../../domain/repository/article_repository.dart';
import 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final ArticleRepository repository;

  List<Article> _allArticles = [];

  ArticleCubit(this.repository) : super(const ArticleState.initial());

  Future<void> fetchArticles() async {
    emit(const ArticleState.loading());
    try {
      final articles = await repository.getArticles();
      _allArticles = articles;
      emit(ArticleState.loaded(articles));
    } catch (e) {
      emit(ArticleState.error(e.toString()));
    }
  }

  void search(String query) {
    final filtered = _allArticles.where((a) =>
    a.title.toLowerCase().contains(query.toLowerCase()) ||
        a.body.toLowerCase().contains(query.toLowerCase())).toList();

    emit(ArticleState.loaded(filtered));
  }
}
