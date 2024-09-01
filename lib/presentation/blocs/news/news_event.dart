part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}
class FetchAllNews extends NewsEvent{}
class AddToFavourites extends NewsEvent{
  final Article article;
  AddToFavourites({required this.article});
}
