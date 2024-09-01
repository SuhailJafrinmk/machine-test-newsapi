import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/core/utils/constants.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';

/// A page that displays detailed information about a specific news article.
///
/// This widget presents a detailed view of a news article including its
/// image, title, publication date, and description.
///
/// The [article] parameter is required and represents the news article 
/// whose details will be shown on this page.
class NewsDetailsPage extends StatelessWidget {
  /// Creates an instance of [NewsDetailsPage].
  ///
  /// The [article] parameter must not be null and should provide the
  /// details of the news article to be displayed.
  final Article article;

  const NewsDetailsPage({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Text('Back'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: SizedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      article.urlToImage ?? AppAssetImages.placeholderImage,
                      fit: BoxFit.cover,  // Ensure the image covers the area
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Text(
                        article.title,
                        style: theme.textTheme.headline1,
                        overflow: TextOverflow.ellipsis,  // Handle overflow
                        maxLines: 2,
                      ),
                      SizedBox(height: 8),
                      Text(
                        article.publishedAt,
                        style: theme.textTheme.bodyText2
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Text(
                      article.description ?? 'Not available',
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
