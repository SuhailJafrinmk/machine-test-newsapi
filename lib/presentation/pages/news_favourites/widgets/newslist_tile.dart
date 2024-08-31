import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/core/utils/constants.dart';
import 'package:kalpas_machine_test/data/models/news_model.dart';

class NewsTile extends StatelessWidget {
  
final Article article;

  const NewsTile({super.key, required this.article});


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
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
              AppAssetImages.placeholderImage,
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
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  article.content ?? 'no content available',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        color: Colors.grey[600],
                      ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  article.author ?? 'author not available',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        color: Colors.grey[500],
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
