part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}
class FetchAllNews extends NewsEvent{}
class AddToFavourites extends NewsEvent{
  final Article article;
  AddToFavourites({required this.article});
}
class GetFavorites extends NewsEvent{}
class RemoveFavourites extends NewsEvent{
  final String id;
  RemoveFavourites({required this.id});
}