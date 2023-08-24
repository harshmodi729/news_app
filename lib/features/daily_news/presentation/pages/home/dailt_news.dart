import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/blocs/aricle/article_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      // actions: [
      //   GestureDetector(
      //     onTap: () => _onShowSavedArticlesViewTapped(context),
      //     child: const Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 14),
      //       child: Icon(Icons.bookmark, color: Colors.black),
      //     ),
      //   ),
      // ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is ArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is ArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is ArticleDone) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Text(state.articleEntity!.articles[index].title);
              // return ArticleWidget(
              //   article: state.articles![index] ,
              //   onArticlePressed: (article) => _onArticlePressed(context,article),
              // );
            },
            itemCount: state.articleEntity!.articles.length,
          );
        }
        return Container();
      },
    );
  }
}
