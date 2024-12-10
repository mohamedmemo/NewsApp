import 'package:flutter/material.dart';
import 'package:newsapp/model/ArticlesRespons/Article.dart';
import 'package:newsapp/remote/ApiManager.dart';
import '../categories_widget/ArticleItem.dart';

class Articleslist extends StatefulWidget {

String sourceId;
Articleslist({required this.sourceId});

  @override
  State<Articleslist> createState() => _ArticleslistState();
}

class _ArticleslistState extends State<Articleslist> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getArticles(widget.sourceId),
        builder: (context, snapshot) {
         if(snapshot.connectionState == ConnectionState.waiting){
           return Center(child: CircularProgressIndicator(),);
         }
         if(snapshot.hasError){
           return Column(
             children: [
               Text(snapshot.error?.toString()??""),
               ElevatedButton(onPressed: () {
                 setState(() {});
               }, child: Text("Try again"))
             ],
           );
         }
         var response = snapshot.data;
         if(response?.status =="error"){
           return Column(
             children: [
               Text(response?.message??""),
               ElevatedButton(onPressed: () {
                 setState(() {});
               }, child: Text("Try again"))
             ],
           );
         }
         List<Article> articles = response?.articles??[];
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: articles.length,
            itemBuilder: (context, index) => Articleitem(
              article: articles[index],
            ),
          );
        },
    );
  }
}