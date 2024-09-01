import 'package:hive/hive.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';
import 'package:kalpas_machine_test/data/models/source_model.dart';


class HiveAdaptersRegister {
  static void registerAdapters() {
    Hive.registerAdapter(SourceAdapter());
    Hive.registerAdapter(ArticleAdapter());
  }
}
