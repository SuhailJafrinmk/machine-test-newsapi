import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kalpas_machine_test/core/utils/constants.dart';
import 'package:kalpas_machine_test/core/utils/custom_logger.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';
import 'package:kalpas_machine_test/presentation/blocs/news/news_bloc.dart';
import 'package:kalpas_machine_test/presentation/pages/news_favourites/news_details_page.dart';
import 'package:kalpas_machine_test/presentation/widgets/custom_snackbar.dart';

class NewsTile extends StatelessWidget {
  final Article article;
  final bool isFavorite;

  const NewsTile({
    super.key,
    required this.article,
    this.isFavorite = false, 
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Slidable(
      key: Key(article.title),
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (context) {
              logInfo('Slidable action triggered');
              if (isFavorite) {
                BlocProvider.of<NewsBloc>(context).add(RemoveFavourites(id: article.title));
                ScaffoldMessenger.of(context).showSnackBar(customSnackbar(context, true, 'Removed from favourites'));
              } else {
                BlocProvider.of<NewsBloc>(context).add(AddToFavourites(article: article));
                ScaffoldMessenger.of(context).showSnackBar(customSnackbar(context, false, 'Added to favourites'));
              }
            },
            backgroundColor: isFavorite ? Colors.red.shade400 : Colors.red.shade100,
            foregroundColor: isFavorite ? Colors.white : Colors.red.shade400,
            icon: isFavorite ? Icons.delete : Icons.favorite,
            label: isFavorite ? 'Remove' : 'Favorite',
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetailsPage(article: article)));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  article.urlToImage ?? AppAssetImages.placeholderImage,
                  width: screenWidth * 0.25,
                  height: screenWidth * 0.25,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Icon(
                    Icons.image,
                    color: Colors.grey,
                    size: screenWidth * 0.25,
                  ),
                ),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      article.description ?? 'No content available',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyText2?.copyWith(
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      children: [
                        Icon(Icons.calendar_month, size: 20),
                        const SizedBox(width: 4.0),
                        Text(
                          article.publishedAt ?? 'Date not available',
                          style: theme.textTheme.caption?.copyWith(
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

