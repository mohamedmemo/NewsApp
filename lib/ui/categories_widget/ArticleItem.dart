import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../model/ArticlesRespons/Article.dart';
import '../categories_details/itemDetsils.dart';

class Articleitem extends StatelessWidget {

  final Article article;
  const Articleitem({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Itemdetsils.routeName,arguments: ArticleData(
          urlToImage: article.urlToImage,
          title: article.title,
          source: article.source,
          publishedAt: article.publishedAt,
          content: article.content,
          url: article.url,
        ));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage??"",
            width: double.infinity,
            height: 232.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
            errorWidget: (context, url, error) => Icon(Icons.error_outline,size: 40.sp,),
          ),
          Text(article.source?.name??""),
          Text(article.title??"",style: Theme.of(context).textTheme.titleLarge,),
          Align(
            alignment: Alignment.centerRight,
              child: Text(timeago.format(DateTime.parse(article.publishedAt??""))))
        ],
      ),
    );
  }
}