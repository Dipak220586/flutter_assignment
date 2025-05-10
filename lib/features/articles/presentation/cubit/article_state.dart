import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/article.dart';

part 'article_state.freezed.dart';

@freezed
class ArticleState with _$ArticleState {
  const factory ArticleState.initial() = _Initial;
  const factory ArticleState.loading() = _Loading;
  const factory ArticleState.loaded(List<Article> articles) = _Loaded;
  const factory ArticleState.error(String message) = _Error;
}
