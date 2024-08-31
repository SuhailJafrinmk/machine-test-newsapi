import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/newslist_tile.dart';

class AllNewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is AllNewsFetched) {
              final data = state.allNews;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final singleNews = data[index];
                  return NewsTile(article: singleNews);
                },
              );
            }
            return SizedBox();
          },
        ));
  }
}
