import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/ui/categories_widget/CategoryItem.dart';
import '../../model/CategoryModel.dart';

class Categorieswidget extends StatelessWidget {
  void Function(String category) onPress;
  Categorieswidget({super.key,required this.onPress});

  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '''Pick your category
of interest''',style: Theme.of(context).textTheme.titleSmall,),
          SizedBox(height: 29.h,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1/1,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 25.w,
              ),
              itemBuilder: (context, index) => Categoryitem(
                onPress: onPress,
                  categoryModel: CategoryModel.categories[index],
                  index: index
              ),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}