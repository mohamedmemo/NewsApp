import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/SourcesRespons/Source.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../categories_widget/WebView.dart';

class Itemdetsils extends StatefulWidget {
  static const String routeName = 'Itemdetsils';

  @override
  State<Itemdetsils> createState() => _ItemdetsilsState();
}

class _ItemdetsilsState extends State<Itemdetsils> {

  @override
  Widget build(BuildContext context) {
    ArticleData articleData = ModalRoute.of(context)?.settings.arguments as ArticleData;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News Title"),
        ),
        body: Padding(
          padding: REdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: articleData.urlToImage??"",
                width: double.infinity,
                height: 232.h,
                fit: BoxFit.fill,
                placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                errorWidget: (context, url, error) => Icon(Icons.error_outline,size: 40.sp,),
              ),
              SizedBox(height: 5.h,),
              Text(articleData.source?.name??""),
              Text(articleData.title??"",style: Theme.of(context).textTheme.titleLarge,),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(timeago.format(DateTime.parse(articleData.publishedAt??"")))),
              Expanded(
                child: Padding(
                  padding:  REdgeInsets.symmetric(horizontal: 15,vertical: 18),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 12,vertical: 24),
                            child: Text(articleData.content??"",style: Theme.of(context).textTheme.bodyMedium,),
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, WebView.routeName,
                                      arguments: Webviewlink(
                                        url:articleData.url,));
                                },
                                  child: Text("View Full Article",style: TextStyle(color: Colors.blueAccent),)
                              ),
                              SizedBox(width: 5.w,),
                              Icon(Icons.arrow_right_sharp,size: 15.sp)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class ArticleData{
  Source? source;
  String? title;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  ArticleData({this.source,this.title,this.url,this.urlToImage,this.publishedAt,this.content});
}