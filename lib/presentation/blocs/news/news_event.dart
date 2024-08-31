part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}
class FetchAllNews extends NewsEvent{}
