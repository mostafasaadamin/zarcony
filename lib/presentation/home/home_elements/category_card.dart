
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony/data/category.dart';
import 'package:zarcony/elements/general_text_view.dart';

class CategoryCard extends StatelessWidget {
  Category category;

  CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70.w,
          height: 60.h,
          decoration:  BoxDecoration(
            color: category.color,
            borderRadius:const BorderRadius.all(Radius.circular(12)),
          ),
        ),
        SizedBox(height: 5.h,),
        VooTextView(
          color: Colors.black,
          fontFamily: "din",
          fontSize: 14.sp,
          isBold: false,
          text:category.title!,
          overflow: true,
        ),

      ],
    );
  }
}
