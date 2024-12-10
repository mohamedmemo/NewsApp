import 'package:flutter/material.dart';
import 'package:newsapp/ui/categories_details/categoriesDetailsWidget.dart';
import 'package:newsapp/ui/categories_widget/CategoriesWidget.dart';
import 'package:newsapp/ui/settings_widget/SettingsWidget.dart';
import '../Search/SearchWidget.dart';
import 'CustomDrawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget selectedWidget;

  @override
  void initState() {
    super.initState();
    selectedWidget = Categorieswidget(onPress: showCategoryDetailsWidget,);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fill
        ),
      ),
      child: Scaffold(
        drawer: Drawer(
          child: Customdrawer(onPress: selectDrawerItem,),
        ),

        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchWidget.routeName);
              },
              icon: const Icon(Icons.search_rounded),

            )
          ],
          title: const Text('News App'),
        ),
        body: selectedWidget,
      ),
    );

  }
  selectDrawerItem(DrawerTabs value){
    switch(value){
      case DrawerTabs.CATEGORIES:{
        setState(() {
          selectedWidget = Categorieswidget(onPress: showCategoryDetailsWidget,);
        });
        Navigator.pop(context);
      }
      case DrawerTabs.SETTINGS:{
        setState(() {
          selectedWidget = Settingswidget();
        });
        Navigator.pop(context);

      }
    }
  }
  showCategoryDetailsWidget(String category){
    setState(() {
      selectedWidget = Categoriesdetailswidget(category: category,);
    });
  }
}
enum DrawerTabs{
  CATEGORIES,
  SETTINGS,
}

