
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';

class FavouritedNewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final bloc=BlocProvider.of<NewsBloc>(context);
    return Center(
      child: ElevatedButton(onPressed: (){
        bloc.add(FetchAllNews());
      }, child: Text('fetchnews')),
    );
  }
}
