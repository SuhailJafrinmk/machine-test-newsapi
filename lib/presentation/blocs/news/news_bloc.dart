import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kalpas_machine_test/core/utils/custom_logger.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';
import 'package:kalpas_machine_test/domain/repositories/favourites_repository.dart';
import 'package:kalpas_machine_test/domain/repositories/news_repository.dart';
import 'package:meta/meta.dart';
part 'news_event.dart';
part 'news_state.dart';

/// A BLoC that manages the state and events related to news articles and favourites.
///
/// The [NewsBloc] handles fetching news articles, adding them to favourites,
/// retrieving favourites, and removing items from the favourites list. It uses
/// [NewsRepository] to fetch news data and [FavouritesRepository] to manage
/// the favourites data locally.
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  /// The repository that provides news articles.
  final NewsRepository newsRepository;

  /// The repository that manages favourites locally.
  final FavouritesRepository favouritesRepository;

  /// Creates a [NewsBloc] with the given [newsRepository] and [favouritesRepository].
  ///
  /// The initial state of the BLoC is [NewsInitial]. The constructor also sets
  /// up the event handlers for various events like [FetchAllNews], [AddToFavourites],
  /// [GetFavorites], and [RemoveFavourites].
  NewsBloc(this.newsRepository, this.favouritesRepository)
      : super(NewsInitial()) {
    on<FetchAllNews>(fetchAllNews);
    on<AddToFavourites>(addToFavourites);
    on<GetFavorites>(getFavorites);
    on<RemoveFavourites>(removeFavourites);
  }

  /// Event handler for [FetchAllNews].
  ///
  /// This method is triggered when the [FetchAllNews] event is added. It fetches
  /// all news articles from the [newsRepository] and emits an [AllNewsFetched] state
  /// with the fetched articles. If an error occurs during fetching, it emits an
  /// [ErrorFetchingAllNews] state with an error message.
  FutureOr<void> fetchAllNews(
      FetchAllNews event, Emitter<NewsState> emit) async {
    logInfo('Inside the fetchAllNews event handler');
    emit(AllNewsLoading());
    final response = await newsRepository.getAllNews();
    response.fold(
      ifLeft: (value) =>
          emit(ErrorFetchingAllNews(errorMessage: value.errorMessage)),
      ifRight: (value) {
        final data = value.data["articles"] as List<dynamic>;
        List<Article> allNews = data
            .map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList();
        logInfo(
            'The title of the first item in the list of articles is ${allNews.first.title}');
        emit(AllNewsFetched(allNews: allNews));
      },
    );
  }

  /// Event handler for [AddToFavourites].
  ///
  /// This method is triggered when the [AddToFavourites] event is added. It adds
  /// the provided [Article] to the favourites using [favouritesRepository].
  /// If an error occurs while adding to favourites, it logs the error.
  FutureOr<void> addToFavourites(
      AddToFavourites event, Emitter<NewsState> emit) async {
    logInfo('Inside the event handler for adding the news to favourites');
    try {
      await favouritesRepository.addToFavourites(event.article);
      logInfo('Successfully added to Hive');
    } catch (e) {
      logError('Error adding favourites to Hive: ${e.toString()}');
    }
  }

  /// Event handler for [GetFavorites].
  ///
  /// This method is triggered when the [GetFavorites] event is added. It retrieves
  /// the list of favourite articles from the [favouritesRepository] and emits a
  /// [FetchedFavouriteArticles] state. If an error occurs during retrieval, it
  /// emits an [ErrorReadingLocalStorage] state with an error message.
  FutureOr<void> getFavorites(GetFavorites event, Emitter<NewsState> emit) {
    logInfo('Inside the event handler for getting favourites');
    try {
      final List<Article> favorites = favouritesRepository.getFavourites();
      emit(FetchedFavouriteArticles(favourites: favorites));
    } catch (e) {
      emit(ErrorReadingLocalStorage(errorMessage: e.toString()));
    }
  }

  /// Event handler for [RemoveFavourites].
  ///
  /// This method is triggered when the [RemoveFavourites] event is added. It removes
  /// the specified article from the favourites list using [favouritesRepository]
  /// and emits a [RemovedFromFavourites] state. If an error occurs while removing
  /// the article, it logs the error.
  FutureOr<void> removeFavourites(
      RemoveFavourites event, Emitter<NewsState> emit) async {
    logInfo('Inside the event handler for removing items from favourites list');
    try {
      await favouritesRepository.removeFavorites(event.id);
      emit(RemovedFromFavourites());
      logInfo('Successfully removed from Hive');
    } catch (e) {
      logError('Error removing favourites from Hive: ${e.toString()}');
    }
  }
}
