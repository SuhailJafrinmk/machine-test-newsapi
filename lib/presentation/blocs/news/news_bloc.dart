import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:kalpas_machine_test/core/utils/custom_logger.dart';
import 'package:kalpas_machine_test/data/models/news_model.dart';
import 'package:kalpas_machine_test/domain/repositories/news_repository.dart';
import 'package:meta/meta.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(NewsInitial()) {
    on<FetchAllNews>(fetchAllNews);
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
}
