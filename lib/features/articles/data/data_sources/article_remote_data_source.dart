import 'package:dio/dio.dart';
import '../model/article_model.dart';
import '../../../../core/network/dio_client.dart';

class ArticleRemoteDataSource {
  Future<List<ArticleModel>> fetchArticles() async {
    try {
      final response = await DioClient.dio.get('/posts');

      final List<dynamic> data = response.data;
      return data.map((json) => ArticleModel.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Network Error: ${e.message}');
    }
  }
}



