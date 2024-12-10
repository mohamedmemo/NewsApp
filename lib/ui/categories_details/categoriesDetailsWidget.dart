import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/remote/ApiManager.dart';
import '../../model/SourcesRespons/Source.dart';
import 'ArticlesList.dart';

class Categoriesdetailswidget extends StatefulWidget {
  String category;
  Categoriesdetailswidget({super.key,required this.category});

  @override
  State<Categoriesdetailswidget> createState() => _CategoriesdetailswidgetState();
}

class _CategoriesdetailswidgetState extends State<Categoriesdetailswidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.category),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasError){
            return Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(
                    onPressed: () {setState(() {});},
                    child: Text('Try again'))
              ],
            );
          }
          var response = snapshot.data;
          if(response?.status =="error"){
            return Column(
              children: [
                Text(response?.message??""),
                ElevatedButton(onPressed: () {
                  setState(() {

                  });
                }, child: Text("Try again"))
              ],
            );
          }
          List<Source> sources = response?.sources??[];
          return DefaultTabController(
            length: sources.length,
            child: Padding(
              padding: REdgeInsets.all(16),
              child: Column(
                children: [
                  TabBar(
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Theme.of(context).colorScheme.primary,
                      dividerHeight: 0,
                      tabs: sources.map((source)=> Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.r),
                              border: Border.all(color: Theme.of(context).colorScheme.primary,width: 1.w)
                          ),
                          child: Padding(
                            padding:  REdgeInsets.symmetric(horizontal: 16),
                            child: Text(source.name??"",style: Theme.of(context).textTheme.headlineSmall,),
                          ),
                        ),
                      )).toList()
                  ),
                  SizedBox(height: 5.h,),
                  Expanded(
                    child: TabBarView(
                      children: sources.map((source)=>Articleslist(sourceId: source.id??"")).toList(),
                    ),
                  )
                ],
              ),
            ),
          );
        },
    );
  }
}