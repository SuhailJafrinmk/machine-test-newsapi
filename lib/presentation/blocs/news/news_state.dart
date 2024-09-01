part of 'news_bloc.dart';

/// Base class for all states related to the [NewsBloc].
///
/// All states that represent the state of the news data extend from this class.
@immutable
sealed class NewsState {}

/// Initial state when the [NewsBloc] is first created.
///
/// This state represents the initial state of the bloc before any events have been processed.
final class NewsInitial extends NewsState {}

/// State indicating that all news articles have been successfully fetched.
///
/// [allNews] contains a list of [Article] objects representing the fetched news articles.
class AllNewsFetched extends NewsState {
  final List<Article> allNews;

  /// Creates an [AllNewsFetched] state with the given list of [allNews].
  AllNewsFetched({required this.allNews});
}

/// State indicating that news articles are currently being loaded.
///
/// This state is emitted when the bloc is in the process of fetching news articles.
class AllNewsLoading extends NewsState {}

/// State indicating that there was an error while fetching news articles.
///
/// [errorMessage] contains a description of the error that occurred.
class ErrorFetchingAllNews extends NewsState {
  final String errorMessage;

  /// Creates an [ErrorFetchingAllNews] state with the given [errorMessage].
  ErrorFetchingAllNews({required this.errorMessage});
}

/// State indicating that favourite articles have been successfully fetched.
///
/// [favourites] contains a list of [Article] objects representing the fetched favourite articles.
class FetchedFavouriteArticles extends NewsState {
  final List<Article> favourites;

  /// Creates a [FetchedFavouriteArticles] state with the given list of [favourites].
  FetchedFavouriteArticles({required this.favourites});
}

/// State indicating that an article has been successfully removed from the favourites list.
///
/// This state is emitted after an article has been removed from the favourites list.
class RemovedFromFavourites extends NewsState {}

/// State indicating that there was an error while reading from local storage.
///
/// [errorMessage] contains a description of the error that occurred.
class ErrorReadingLocalStorage extends NewsState {
  final String errorMessage;

  /// Creates an [ErrorReadingLocalStorage] state with the given [errorMessage].
  ErrorReadingLocalStorage({required this.errorMessage});
}
