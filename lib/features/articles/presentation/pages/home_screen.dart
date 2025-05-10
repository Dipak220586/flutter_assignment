import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/article_cubit.dart';
import '../cubit/article_state.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged() {
    context.read<ArticleCubit>().search(_searchController.text);
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    context.read<ArticleCubit>().fetchArticles();
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search articles...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ArticleCubit, ArticleState>(
              builder: (context, state) {
                return state.when(
                  initial: () => Container(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  loaded: (articles) => ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return Card(
                        margin: const EdgeInsets.all(8),
                        child: ListTile(
                          title: Text(article.title),
                          subtitle: Text(
                            article.body.length > 50
                                ? '${article.body.substring(0, 50)}...'
                                : article.body,
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail',
                              arguments: article,
                            /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailScreen(article: article),
                              ),*/
                            );
                          },
                        ),
                      );
                    },
                  ),
                  error: (msg) => Center(child: Text(msg)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
