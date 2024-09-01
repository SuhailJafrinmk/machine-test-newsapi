import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpas_machine_test/core/utils/constants.dart';
import 'package:kalpas_machine_test/data/models/article_model.dart';

class NewsDetailsPage extends StatelessWidget {
  final Article article;
  const NewsDetailsPage({super.key, required this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(CupertinoIcons.back)),
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
                    child: Image.network(article.urlToImage ?? AppAssetImages.placeholderImage)),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(article.title),
                      Text(article.publishedAt ),
                    ],
                  ),
                )
                ),
                Expanded(
                  flex: 6,
                  child: SizedBox(
                  child: Text(article.description ?? 'not available'),
                )),
            ],
          ),
        ),
      ),
    );
  }
}