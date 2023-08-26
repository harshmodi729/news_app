import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/blocs/aricle/article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:news_app/service_injection.dart';
// GET https://newsapi.org/v2/top-headlines?country=us&apiKey=c54fab7086b64761bf4be9df7fc0f998

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
      create: (context) => si()..add(const GetArticles()),
      child: MaterialApp(
        title: 'News App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const DailyNews(),
      ),
    );
  }
}
