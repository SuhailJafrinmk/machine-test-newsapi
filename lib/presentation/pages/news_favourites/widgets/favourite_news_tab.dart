import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/newslist_tile.dart';

/// A tab that displays a list of favorited news articles.
///
/// This widget uses the [NewsBloc] to fetch and display news articles that
/// have been marked as favorites. It updates the list of favorites when an
/// item is removed from favorites.
class FavouritedNewsTab extends StatefulWidget {
  @override
  State<FavouritedNewsTab> createState() => _FavouritedNewsTabState();
}

class _FavouritedNewsTabState extends State<FavouritedNewsTab> {
  @override
  void initState() {
    super.initState();
    // Fetch the list of favorited news articles when the widget is initialized.
    BlocProvider.of<NewsBloc>(context).add(GetFavorites());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NewsBloc>(context);

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          // Re-fetch the list of favorites if an item is removed from favorites.
          if (state is RemovedFromFavourites) {
            bloc.add(GetFavorites());
          }
        },
        builder: (context, state) {
          // Display an error message if there was an issue reading from local storage.
          if (state is ErrorReadingLocalStorage) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          // Display the list of favorited news articles if successfully fetched.
          if (state is FetchedFavouriteArticles) {
            final data = state.favourites;
            // Show a message if there are no items in the favorites list.
            if (data.isEmpty) {
              return Center(
                child: Text('No items in favorites list'),
              );
            }
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: data.length,
              itemBuilder: (context, index) {
                final singleNews = data[index];
                return NewsTile(
                  article: singleNews,
                  isFavorite: true,
                );
              },
            );
          }
          // Return an empty container if none of the above states are active.
          return SizedBox();
        },
      ),
    );
  }
}
