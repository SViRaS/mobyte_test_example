import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  const OrangeButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: AppColors.orangeColor,
          borderRadius: BorderRadius.all(Radius.circular(15.r))),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Jost',
            fontSize: 16.sp,
            color: AppColors.whiteColor),
      )),
    );
  }
}
