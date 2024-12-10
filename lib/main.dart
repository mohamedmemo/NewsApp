import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/style/AppStyle.dart';
import 'package:newsapp/ui/Search/SearchWidget.dart';
import 'package:newsapp/ui/categories_details/itemDetsils.dart';
import 'package:newsapp/ui/categories_widget/WebView.dart';
import 'package:newsapp/ui/home/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppStyle.lightTheme,
          routes: {
            HomeScreen.routeName:(_)=>HomeScreen(),
            Itemdetsils.routeName:(_)=>Itemdetsils(),
            WebView.routeName:(_)=>WebView(),
            SearchWidget.routeName:(_)=>SearchWidget(),
          },
          initialRoute: HomeScreen.routeName,
        );
      },
    );
  }
}


