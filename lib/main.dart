import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kalpas_machine_test/config/theme.dart';
import 'package:kalpas_machine_test/core/network/dio_factory.dart';
import 'package:kalpas_machine_test/data/datasources/local/hive/hive_adapter_register.dart';
import 'package:kalpas_machine_test/data/repositories/news_repository_impl.dart';
import 'package:kalpas_machine_test/domain/repositories/favourites_repository.dart';
import 'package:kalpas_machine_test/injection_container.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/news_favourites_page.dart';
import 'package:kalpas_machine_test/injection_container.dart' as di;

/// Entry point for the Flutter application.
///
/// Initializes Flutter bindings, Hive, and dependency injection.
/// Runs the app with [MyApp] as the root widget.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  HiveAdaptersRegister.registerAdapters();
  await di.init();
  DioClient.instance.initialize();
  runApp(const MyApp());
}

/// The root widget of the application.
///
/// Sets up the [MultiBlocProvider] with the [NewsBloc] and initializes the application with [MaterialApp].
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(sl<NewsRepositoryImpl>(), sl<FavouritesRepository>()),
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
