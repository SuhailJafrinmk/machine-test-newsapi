import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kalpas_machine_test/core/utils/custom_logger.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';
import 'package:kalpas_machine_test/domain/repositories/favourites_repository.dart';
import 'package:kalpas_machine_test/domain/repositories/news_repository.dart';
import 'package:meta/meta.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  final FavouritesRepository favouritesRepository;
  NewsBloc(this.newsRepository, this.favouritesRepository)
      : super(NewsInitial()) {
    on<FetchAllNews>(fetchAllNews);
    on<AddToFavourites>(addToFavourites);
    on<GetFavorites>(getFavorites);
    on<RemoveFavourites>(removeFavourites);
  }

  FutureOr<void> fetchAllNews(
      FetchAllNews event, Emitter<NewsState> emit) async {
    logInfo('inside the fetchallnews event handler');
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
            'the title of first item in the  list of articles are ${allNews.first.title}');
        emit(AllNewsFetched(allNews: allNews));
      },
    );
  }

  FutureOr<void> addToFavourites(
      AddToFavourites event, Emitter<NewsState> emit) async {
    logInfo('inside the event handler for adding the new to favourites');
    try {
      await favouritesRepository.addToFavourites(event.article);
      logInfo('successfully added to hive');
    } catch (e) {
      logError('error adding favorites to hive ${e.toString()}');
    }
  }

  FutureOr<void> getFavorites(GetFavorites event, Emitter<NewsState> emit) {
    logInfo('inside the event handler for getting favourites');
    final List<Article> favorites = favouritesRepository.getFavourites();
    emit(FetchedFavouriteArticles(favourites: favorites));
  }


  FutureOr<void> removeFavourites(RemoveFavourites event, Emitter<NewsState> emit)async{
       logInfo('inside the event handler for removing items from favourites list');
    try {
      await favouritesRepository.removeFavorites(event.id);
      emit(RemovedFromFavourites());
      logInfo('successfully removed from  hive');
    } catch (e) {
      logError('error removing favorites to hive ${e.toString()}');
    }
  }
}
