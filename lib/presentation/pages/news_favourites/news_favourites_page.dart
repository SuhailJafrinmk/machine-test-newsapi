import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/all_news_tab.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/favourite_news_tab.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/widgets/news_tab.dart';

/// A page that displays news and favorited news in separate tabs.
///
/// This page uses a [DefaultTabController] to manage the state of the [TabBar] and its corresponding [TabBarView].
/// It contains two tabs: one for news and one for favorited news. The content of each tab is provided by
/// the [AllNewsTab] and [FavouritedNewsTab] widgets, respectively.
class NewsFavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              NewsTab(icon: Icons.menu_rounded, label: 'News'),
              NewsTab(icon: Icons.favorite, label: 'Favs', iconColor: Colors.red),
            ],
          ),
          title: const Text('News & Favourites'),
        ),
        body: TabBarView(
          children: [
            AllNewsTab(), // Displays all news articles
            FavouritedNewsTab(), // Displays favorited news articles
          ],
        ),
      ),
    );
  }
}
