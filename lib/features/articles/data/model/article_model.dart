import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/article.dart';
part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    required int id,
    required String title,
    required String body,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
}

extension ArticleModelX on ArticleModel {
  Article toEntity() {
    return Article(id: id, title: title, body: body);
  }
}

