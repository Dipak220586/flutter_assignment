import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/articles/data/data_sources/article_remote_data_source.dart';
import 'features/articles/data/repositories/article_repository_impl.dart';
import 'features/articles/domain/repository/article_repository.dart';
import 'features/articles/presentation/cubit/article_cubit.dart';
import 'features/articles/presentation/pages/detail_screen.dart';
import 'features/articles/presentation/pages/home_screen.dart';

void main() {
  final ArticleRepository repository = ArticleRepositoryImpl(ArticleRemoteDataSource());
  runApp(
    BlocProvider(
      create: (_) => ArticleCubit(repository),
      child: const Application(),
    ),
  );
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Articles App',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
      },
    );
  }
}


