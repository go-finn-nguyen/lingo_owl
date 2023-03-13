import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/type_defs/type_defs.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class LArticle with _$LArticle {
  const factory LArticle({
    required ArticleId id,
    required String htmlCode,
  }) = _LArticle;

  factory LArticle.fromJson(Map<String, Object?> json) =>
      _$LArticleFromJson(json);
}
