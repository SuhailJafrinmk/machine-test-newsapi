import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/newslist_tile.dart';
import 'package:kalpas_machine_test/presentation/widgets/custom_snackbar.dart';
import 'package:kalpas_machine_test/presentation/widgets/progress_indicator.dart';

/// A tab that displays a list of all news articles.
///
/// This widget uses the [NewsBloc] to fetch and display news articles.
/// It shows a loading indicator while fetching news, an error message if
/// there's an issue, and the list of news articles when successfully fetched.
class AllNewsTab extends StatefulWidget {
  @override
  State<AllNewsTab> createState() => _AllNewsTabState();
}

class _AllNewsTabState extends State<AllNewsTab> {
  @override
  void initState() {
    super.initState();
    // Fetch all news articles when the widget is initialized.
    BlocProvider.of<NewsBloc>(context).add(FetchAllNews());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: BlocConsumer<NewsBloc, NewsState>(
        listener: (context, state) {
          // Show a snackbar with an error message if fetching news fails.
          if (state is ErrorFetchingAllNews) {
            ScaffoldMessenger.of(context).showSnackBar(
                customSnackbar(context, true, state.errorMessage));
          }
        },
        builder: (context, state) {
          // Display an error message if there was an issue fetching news.
          if (state is ErrorFetchingAllNews) {
            return const Center(
              child: Text('An error occurred'),
            );
          }
          // Display a loading indicator while fetching news.
          if (state is AllNewsLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomProgressIndicator(size: 30),
                  SizedBox(height: 10),
                  Text('Fetching latest news...'),
                ],
              ),
            );
          }
          // Display the list of news articles when fetched successfully.
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
          // Return an empty container if none of the above states are active.
          return const SizedBox();
        },
      ),
    );
  }
}
