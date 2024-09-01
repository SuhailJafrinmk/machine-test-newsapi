part of 'news_bloc.dart';

/// Base class for all news-related events in the [NewsBloc].
///
/// All events that can be dispatched to the [NewsBloc] extend from this class.
@immutable
sealed class NewsEvent {}

/// Event to trigger fetching all news articles.
///
/// When this event is added to the [NewsBloc], it will initiate the process
/// of fetching all news articles from the repository.
class FetchAllNews extends NewsEvent {}

/// Event to add an article to the favourites list.
///
/// When this event is added to the [NewsBloc], it will trigger the addition
/// of the specified [article] to the favourites list in the local repository.
///
/// [article] is the [Article] that needs to be added to favourites.
class AddToFavourites extends NewsEvent {
  final Article article;

  /// Creates an [AddToFavourites] event with the given [article].
  AddToFavourites({required this.article});
}

/// Event to fetch all favourite articles from local storage.
///
/// When this event is added to the [NewsBloc], it will trigger the retrieval
/// of all articles that have been marked as favourites.
class GetFavorites extends NewsEvent {}

/// Event to remove an article from the favourites list.
///
/// When this event is added to the [NewsBloc], it will trigger the removal
/// of the article with the specified [id] from the favourites list in the local repository.
///
/// [id] is the unique identifier of the article to be removed from favourites.
/// In our case id is the title of an article
class RemoveFavourites extends NewsEvent {
  final String id;

  /// Creates a [RemoveFavourites] event with the given [id].
  RemoveFavourites({required this.id});
}

