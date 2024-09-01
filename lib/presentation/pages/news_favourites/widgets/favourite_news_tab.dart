
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/newslist_tile.dart';

class FavouritedNewsTab extends StatefulWidget {
  @override
  State<FavouritedNewsTab> createState() => _FavouritedNewsTabState();
}

class _FavouritedNewsTabState extends State<FavouritedNewsTab> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsBloc>(context).add(GetFavorites());
  }
  @override
  Widget build(BuildContext context) {
  final bloc=BlocProvider.of<NewsBloc>(context);
     return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is FetchedFavouriteArticles) {
              final data = state.favourites;
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final singleNews = data[index];
                  return NewsTile(article: singleNews,);
                },
              );
            }
            return SizedBox();
          },
        ));
  }
}
