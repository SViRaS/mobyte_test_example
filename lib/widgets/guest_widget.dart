import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/const/colors.dart';

class GuestWidget extends StatelessWidget {
  final String avatar;
  final String name;
  final String years;
  final String activity;

  const GuestWidget(
      {super.key,
      required this.avatar,
      required this.name,
      required this.years,
      required this.activity});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 64.h,
          width: 64.w,
          child: Image.asset(avatar, fit: BoxFit.fill,)),
          SizedBox(width: 12.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(name, style: TextStyle(fontSize: 14.sp, fontFamily: 'Jost', fontWeight: FontWeight.w500, color: AppColors.semiBlackColor),),
            Text(years, style: TextStyle(fontSize: 12.sp, fontFamily: 'Jost', fontWeight: FontWeight.w400, color: AppColors.brownColor),),
            Text(activity, style: TextStyle(fontSize: 14.sp, fontFamily: 'Jost', fontWeight: FontWeight.w400, color: AppColors.brownColor),),
            
          ],),
      ],
    );
  }
}
