import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../remote/ApiManager.dart';
import '../categories_widget/ArticleItem.dart';

class SearchWidget extends StatefulWidget {
  static const String routeName = 'SearchWidget';

  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
 var Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage("assets/images/background.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding:  REdgeInsets.symmetric(horizontal: 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Padding(
                padding:  REdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: Controller,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search_rounded,color: Theme.of(context).colorScheme.primary,size: 16.sp,),
                    prefixIcon: IconButton(onPressed: () {
                      Controller.clear();
                      setState(() {});
                    }, icon: Icon(Icons.close,color: Theme.of(context).colorScheme.primary,size: 16.sp,)),
                    border: InputBorder.none,
                    hintText: "Search Article",
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.50),
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                  ),

                ),
              ),
            ),
          )
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: ApiManager.getArticlesSearch(Controller.text),
                builder: (context, snapshot) {
                  try{
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    if(snapshot.connectionState == ConnectionState.done && snapshot.hasError){
                      return const Center(child: Text('There is no matching news.'),);
                    }
                    if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                      var articles = snapshot.data?.articles;
                      return ListView.builder(
                        itemCount: articles?.length,
                        itemBuilder: (context, index) => Padding(
                          padding: REdgeInsets.symmetric(horizontal: 25,vertical: 10),
                          child: Articleitem(
                            article: articles![index],
                          ),
                        ),
                      );
                    }
                    return const Text("");

                  }catch(e){
                    return Text(e.toString());
                  }
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}