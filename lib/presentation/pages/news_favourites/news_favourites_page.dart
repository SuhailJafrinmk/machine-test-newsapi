import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/all_news_tab.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/favourite_news_tab.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/news_tab.dart';

class NewsFavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              NewsTab(icon: Icons.menu_rounded, label: 'News'),
              NewsTab(icon: Icons.favorite, label: 'Favs',iconColor: Colors.red,),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllNewsTab(),
            FavouritedNewsTab(),
          ],
        ),
      ),
    );
  }
}
