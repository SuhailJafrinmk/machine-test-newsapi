import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalpas_machine_test/config/theme.dart';
import 'package:kalpas_machine_test/core/network/dio_factory.dart';
import 'package:kalpas_machine_test/data/repositories/news_repository_impl.dart';
import 'package:kalpas_machine_test/domain/repositories/news_repository.dart';
import 'package:kalpas_machine_test/injection_container.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/news_favourites_page.dart';
import 'package:kalpas_machine_test/injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioClient.instance.initialize();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(sl<NewsRepositoryImpl>()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: NewsFavouritesPage(),
      ),
    );
  }
}
