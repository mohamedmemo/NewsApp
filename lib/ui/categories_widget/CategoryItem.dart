import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/model/CategoryModel.dart';

class Categoryitem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final void Function(String) onPress;
  const Categoryitem({super.key,required this.categoryModel,required this.index,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(categoryModel.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.background,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.r),
            topRight: Radius.circular(25.r),
            bottomLeft: Radius.circular(index.isEven?25.r:0),
            bottomRight: Radius.circular(index.isOdd?25.r:0),
          )
        ),
        child: Column(
          children: [
            Image.asset(categoryModel.image,height: 116.h,width: 132.w,),
            SizedBox(height: 10.h,),
            Text(categoryModel.title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 22.sp
            ),),
          ],
        ),
      ),
    );
  }
}
