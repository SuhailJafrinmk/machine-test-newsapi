part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}
class AllNewsFetched extends NewsState{
  final List<Article> allNews;
  AllNewsFetched({required this.allNews});
}
class AllNewsLoading extends NewsState{}
class ErrorFetchingAllNews extends NewsState{
  final String errorMessage;
  ErrorFetchingAllNews({required this.errorMessage});
}
class FetchedFavouriteArticles extends NewsState{
  final List<Article> favourites;
  FetchedFavouriteArticles({required this.favourites});
}