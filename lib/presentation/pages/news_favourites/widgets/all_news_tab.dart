import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/newslist_tile.dart';
import 'package:kalpas_machine_test/presentation/widgets/progress_indicator.dart';

class AllNewsTab extends StatefulWidget {
  @override
  State<AllNewsTab> createState() => _AllNewsTabState();
}

class _AllNewsTabState extends State<AllNewsTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(FetchAllNews());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is AllNewsLoading) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomProgressIndicator(
                      size: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Fetching latest news...',
                    )
                  ],
                ),
              );
            }
            if (state is AllNewsFetched) {
              final data = state.allNews;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final singleNews = data[index];
                  return NewsTile(
                    article: singleNews,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ));
  }
}
