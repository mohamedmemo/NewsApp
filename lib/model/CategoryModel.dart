import 'dart:ui';

class CategoryModel{
  String id;
  String title;
  String image;
  Color background;
  CategoryModel({required this.title,required this.image,required this.background,required this.id});

  static List<CategoryModel> categories = [
    CategoryModel(id:'sports',title: 'sports',image: 'assets/images/sports.png',background: Color(0xffC91C22)),
    CategoryModel(id:'General',title: 'General',image: 'assets/images/Politics.png',background: Color(0xff003E90)),
    CategoryModel(id:'health',title: 'health',image: 'assets/images/health.png',background: Color(0xffED1E79)),
    CategoryModel(id:'bussines',title: 'bussines',image: 'assets/images/bussines.png',background: Color(0xffCF7E48)),
    CategoryModel(id:'Technology',title: 'Technology',image: 'assets/images/environment.png',background: Color(0xff4882CF)),
    CategoryModel(id:'science',title: 'science',image: 'assets/images/science.png',background: Color(0xffF2D352))
  ];
}